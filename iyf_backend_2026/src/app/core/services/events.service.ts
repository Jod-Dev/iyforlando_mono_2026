import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from, map, catchError, throwError, switchMap } from 'rxjs';
import { Event, EventStatus, VolunteerHours, HoursStatus, VolunteerCode, QRCodeData } from '../types';

/**
 * Events Service
 * Migrated from old dashboard useEvents hook
 * Handles event management, volunteer hours tracking, and QR codes
 */
@Injectable({
  providedIn: 'root'
})
export class EventsService {
  private supabase = inject(SupabaseService);

  /**
   * Get all events, ordered by date descending
   */
  getEvents(): Observable<Event[]> {
    return from(
      this.supabase.client
        .from('events')
        .select('*')
        .order('event_date', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapEventFromDb);
      }),
      catchError((error) => {
        // Handle permissions error gracefully
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching events:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get a single event by ID
   */
  getEventById(id: string): Observable<Event | null> {
    return from(
      this.supabase.client
        .from('events')
        .select('*')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) {
          if (error.code === 'PGRST116') return null; // Not found
          throw error;
        }
        return data ? this.mapEventFromDb(data) : null;
      })
    );
  }

  /**
   * Create a new event
   */
  createEvent(eventData: Omit<Event, 'id' | 'createdAt' | 'updatedAt'>): Observable<string> {
    const now = new Date().toISOString();
    // Convert date string to timestamp for event_date field
    const eventDate = new Date(eventData.date).toISOString();
    
    return from(
      this.supabase.client
        .from('events')
        .insert({
          name: eventData.name,
          description: eventData.description,
          event_date: eventDate,
          start_time: eventData.startTime,
          end_time: eventData.endTime,
          location: eventData.location,
          status: eventData.status,
          qr_code: eventData.qrCode,
          created_at: now,
          updated_at: now
        })
        .select('id')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data.id;
      })
    );
  }

  /**
   * Update an event
   */
  updateEvent(id: string, updates: Partial<Event>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.name !== undefined) updateData.name = updates.name;
    if (updates.description !== undefined) updateData.description = updates.description;
    if (updates.date !== undefined) updateData.event_date = new Date(updates.date).toISOString();
    if (updates.startTime !== undefined) updateData.start_time = updates.startTime;
    if (updates.endTime !== undefined) updateData.end_time = updates.endTime;
    if (updates.location !== undefined) updateData.location = updates.location;
    if (updates.status !== undefined) updateData.status = updates.status;
    if (updates.qrCode !== undefined) updateData.qr_code = updates.qrCode;

    return from(
      this.supabase.client
        .from('events')
        .update(updateData)
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  /**
   * Update event status
   */
  updateEventStatus(id: string, status: EventStatus): Observable<boolean> {
    return this.updateEvent(id, { status });
  }

  /**
   * Get volunteer hours for an event (or all events if eventId not provided)
   */
  getVolunteerHours(eventId?: string): Observable<VolunteerHours[]> {
    let query = this.supabase.client
      .from('volunteer_hours')
      .select('*')
      .order('created_at', { ascending: false });

    if (eventId) {
      query = query.eq('event_id', eventId);
    }

    return from(query).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapVolunteerHoursFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching volunteer hours:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Check in a volunteer for an event
   */
  checkIn(
    volunteerCode: string,
    volunteerName: string,
    volunteerEmail: string,
    eventId: string,
    eventName: string,
    location?: { latitude: number; longitude: number; accuracy?: number; address?: string }
  ): Observable<string> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('volunteer_hours')
        .insert({
          volunteer_id: volunteerCode,
          volunteer_name: volunteerName,
          volunteer_email: volunteerEmail,
          event_id: eventId,
          event_name: eventName,
          check_in_time: now,
          check_in_location: location,
          status: 'checked-in',
          created_at: now,
          updated_at: now
        })
        .select('id')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data.id;
      })
    );
  }

  /**
   * Check out a volunteer
   */
  checkOut(hoursId: string, location?: { latitude: number; longitude: number; accuracy?: number; address?: string }): Observable<boolean> {
    // First get the check-in time to calculate hours
    return from(
      this.supabase.client
        .from('volunteer_hours')
        .select('check_in_time')
        .eq('id', hoursId)
        .single()
    ).pipe(
      switchMap(({ data, error }) => {
        if (error) throw error;
        
        const checkInTime = new Date(data.check_in_time);
        const checkOutTime = new Date();
        const totalHours = Math.round(((checkOutTime.getTime() - checkInTime.getTime()) / (1000 * 60 * 60)) * 100) / 100;

        return from(
          this.supabase.client
            .from('volunteer_hours')
            .update({
              check_out_time: checkOutTime.toISOString(),
              check_out_location: location,
              total_hours: totalHours,
              status: 'completed',
              updated_at: checkOutTime.toISOString()
            })
            .eq('id', hoursId)
        ).pipe(
          map(({ error }) => {
            if (error) throw error;
            return true;
          })
        );
      })
    );
  }

  /**
   * Update volunteer hours
   */
  updateHours(id: string, updates: Partial<VolunteerHours>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.notes !== undefined) updateData.notes = updates.notes;
    if (updates.status !== undefined) updateData.status = updates.status;
    if (updates.totalHours !== undefined) updateData.total_hours = updates.totalHours;

    return from(
      this.supabase.client
        .from('volunteer_hours')
        .update(updateData)
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  /**
   * Get volunteer codes for an event (or all events if eventId not provided)
   */
  getVolunteerCodes(eventId?: string): Observable<VolunteerCode[]> {
    let query = this.supabase.client
      .from('volunteer_codes')
      .select('*')
      .order('created_at', { ascending: false });

    if (eventId) {
      query = query.eq('event_id', eventId);
    }

    return from(query).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapVolunteerCodeFromDb);
      })
    );
  }

  /**
   * Create a volunteer code
   */
  createVolunteerCode(
    volunteerName: string,
    volunteerEmail: string,
    eventId: string,
    code?: string
  ): Observable<string> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('volunteer_codes')
        .insert({
          code: code || this.generateCode(6),
          volunteer_name: volunteerName,
          volunteer_email: volunteerEmail,
          event_id: eventId,
          is_active: true,
          created_at: now
        })
        .select('id')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data.id;
      })
    );
  }

  /**
   * Update volunteer code
   */
  updateVolunteerCode(id: string, updates: Partial<VolunteerCode>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.isActive !== undefined) updateData.is_active = updates.isActive;
    if (updates.code !== undefined) updateData.code = updates.code;

    return from(
      this.supabase.client
        .from('volunteer_codes')
        .update(updateData)
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  /**
   * Get volunteer by code
   */
  getVolunteerByCode(code: string): Observable<VolunteerCode | null> {
    return from(
      this.supabase.client
        .from('volunteer_codes')
        .select('*')
        .eq('code', code.toUpperCase())
        .eq('is_active', true)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) {
          if (error.code === 'PGRST116') return null;
          throw error;
        }
        return data ? this.mapVolunteerCodeFromDb(data) : null;
      })
    );
  }

  // Helper methods for mapping database records to types

  private mapEventFromDb(data: any): Event {
    // Handle both event_date (timestamp) and date (date string) formats
    const eventDate = data.event_date || data.date;
    let dateStr: string;
    if (eventDate instanceof Date) {
      dateStr = eventDate.toISOString().split('T')[0];
    } else if (typeof eventDate === 'string') {
      dateStr = eventDate.split('T')[0]; // Extract date part if it's a timestamp string
    } else {
      dateStr = eventDate;
    }

    return {
      id: data.id,
      name: data.name,
      description: data.description,
      date: dateStr,
      startTime: data.start_time || '',
      endTime: data.end_time || '',
      location: data.location || '',
      status: data.status,
      qrCode: data.qr_code,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }

  private mapVolunteerHoursFromDb(data: any): VolunteerHours {
    return {
      id: data.id,
      volunteerId: data.volunteer_id,
      volunteerName: data.volunteer_name,
      volunteerEmail: data.volunteer_email,
      eventId: data.event_id,
      eventName: data.event_name,
      checkInTime: data.check_in_time,
      checkOutTime: data.check_out_time,
      checkInLocation: data.check_in_location,
      checkOutLocation: data.check_out_location,
      totalHours: data.total_hours,
      status: data.status,
      notes: data.notes,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }

  private mapVolunteerCodeFromDb(data: any): VolunteerCode {
    return {
      id: data.id,
      code: data.code,
      volunteerName: data.volunteer_name,
      volunteerEmail: data.volunteer_email,
      eventId: data.event_id,
      isActive: data.is_active,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }

  private generateCode(length: number = 6): string {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }
}

