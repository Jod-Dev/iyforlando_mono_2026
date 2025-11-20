import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from, map, catchError, throwError } from 'rxjs';
import { VolunteerApplication, VolunteerStatus, VolunteerSchedule, ScheduleStatus } from '../types';
import { generateVolunteerCode } from '../utils/volunteer-codes.util';

/**
 * Volunteers Service
 * Migrated from old dashboard useVolunteerApplications and useVolunteerSchedule hooks
 */
@Injectable({
  providedIn: 'root'
})
export class VolunteersService {
  private supabase = inject(SupabaseService);

  /**
   * Get all volunteer applications
   */
  getVolunteerApplications(): Observable<VolunteerApplication[]> {
    return from(
      this.supabase.client
        .from('volunteer_applications')
        .select('*')
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapVolunteerApplicationFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching volunteer applications:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Create a new volunteer application
   */
  createVolunteer(volunteerData: Omit<VolunteerApplication, 'id' | 'createdAt' | 'updatedAt'>): Observable<string> {
    const now = new Date().toISOString();
    const volunteerCode = volunteerData.volunteerCode || generateVolunteerCode(6);

    return from(
      this.supabase.client
        .from('volunteer_applications')
        .insert({
          first_name: volunteerData.firstName,
          last_name: volunteerData.lastName,
          email: volunteerData.email,
          gender: volunteerData.gender,
          tshirt_size: volunteerData.tshirtSize,
          emergency_contact: volunteerData.emergencyContact,
          emergency_phone: volunteerData.emergencyPhone,
          volunteer_code: volunteerCode,
          source: volunteerData.source,
          event_info_accepted: volunteerData.eventInfoAccepted,
          terms_accepted: volunteerData.termsAccepted,
          age: volunteerData.age,
          phone: volunteerData.phone,
          city: volunteerData.city,
          state: volunteerData.state,
          country: volunteerData.country,
          availability: volunteerData.availability,
          interests: volunteerData.interests,
          skills: volunteerData.skills,
          languages: volunteerData.languages,
          background_check_completed: volunteerData.backgroundCheckCompleted,
          training_completed: volunteerData.trainingCompleted,
          orientation_attended: volunteerData.orientationAttended,
          status: volunteerData.status,
          notes: volunteerData.notes,
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
   * Update a volunteer application
   */
  updateVolunteer(id: string, updates: Partial<VolunteerApplication>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.firstName !== undefined) updateData.first_name = updates.firstName;
    if (updates.lastName !== undefined) updateData.last_name = updates.lastName;
    if (updates.email !== undefined) updateData.email = updates.email;
    if (updates.status !== undefined) updateData.status = updates.status;
    if (updates.notes !== undefined) updateData.notes = updates.notes;
    // Add other fields as needed

    return from(
      this.supabase.client
        .from('volunteer_applications')
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
   * Update volunteer status
   */
  updateStatus(id: string, status: VolunteerStatus, notes?: string): Observable<boolean> {
    return this.updateVolunteer(id, { status, notes });
  }

  /**
   * Delete a volunteer application
   */
  deleteVolunteer(id: string): Observable<boolean> {
    return from(
      this.supabase.client
        .from('volunteer_applications')
        .delete()
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  /**
   * Get volunteer schedule
   */
  getVolunteerSchedule(): Observable<VolunteerSchedule[]> {
    return from(
      this.supabase.client
        .from('volunteer_schedule')
        .select('*')
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapVolunteerScheduleFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching volunteer schedule:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get schedule statistics
   */
  getScheduleStats(): Observable<{ total: number; confirmed: number; pending: number; cancelled: number }> {
    return this.getVolunteerSchedule().pipe(
      map((schedule) => {
        const total = schedule.length;
        const confirmed = schedule.filter(s => s.status === 'confirmed' || s.status === 'completed').length;
        const pending = schedule.filter(s => s.status === 'scheduled').length;
        const cancelled = schedule.filter(s => s.status === 'cancelled').length;

        return { total, confirmed, pending, cancelled };
      })
    );
  }

  /**
   * Get schedule grouped by date
   */
  getScheduleByDate(): Observable<Record<string, VolunteerSchedule[]>> {
    return this.getVolunteerSchedule().pipe(
      map((schedule) => {
        const grouped: Record<string, VolunteerSchedule[]> = {};
        schedule.forEach((slot) => {
          if (slot.date) {
            const date = new Date(slot.date).toLocaleDateString();
            if (!grouped[date]) {
              grouped[date] = [];
            }
            grouped[date].push(slot);
          }
        });
        return grouped;
      })
    );
  }

  /**
   * Update volunteer schedule
   */
  updateSchedule(id: string, updates: Partial<VolunteerSchedule>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.status !== undefined) updateData.status = updates.status;
    if (updates.date !== undefined) updateData.date = updates.date;
    if (updates.selectedSlots !== undefined) updateData.selected_slots = updates.selectedSlots;
    if (updates.totalHours !== undefined) updateData.total_hours = updates.totalHours;

    return from(
      this.supabase.client
        .from('volunteer_schedule')
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
   * Cancel volunteer schedule
   */
  cancelSchedule(id: string): Observable<boolean> {
    return this.updateSchedule(id, { status: 'cancelled' });
  }

  /**
   * Delete volunteer schedule
   */
  deleteSchedule(id: string): Observable<boolean> {
    return from(
      this.supabase.client
        .from('volunteer_schedule')
        .delete()
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  // Helper methods for mapping database records to types

  private mapVolunteerApplicationFromDb(data: any): VolunteerApplication {
    return {
      id: data.id,
      firstName: data.first_name,
      lastName: data.last_name,
      email: data.email,
      gender: data.gender,
      tshirtSize: data.tshirt_size,
      emergencyContact: data.emergency_contact,
      emergencyPhone: data.emergency_phone,
      volunteerCode: data.volunteer_code,
      source: data.source,
      eventInfoAccepted: data.event_info_accepted,
      termsAccepted: data.terms_accepted,
      age: data.age,
      phone: data.phone,
      city: data.city,
      state: data.state,
      country: data.country,
      availability: data.availability,
      interests: data.interests,
      skills: data.skills,
      languages: data.languages,
      backgroundCheckCompleted: data.background_check_completed,
      trainingCompleted: data.training_completed,
      orientationAttended: data.orientation_attended,
      status: data.status,
      notes: data.notes,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }

  private mapVolunteerScheduleFromDb(data: any): VolunteerSchedule {
    return {
      id: data.id,
      volunteerName: data.volunteer_name,
      volunteerEmail: data.volunteer_email,
      volunteerCode: data.volunteer_code,
      volunteerPhone: data.volunteer_phone,
      status: data.status,
      date: data.date,
      selectedSlots: data.selected_slots,
      totalHours: data.total_hours,
      slotId: data.slot_id,
      reservedAt: data.reserved_at,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }
}

