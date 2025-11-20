import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from, map, catchError, throwError } from 'rxjs';
import { Registration } from '../types';

/**
 * Registrations Service
 * Migrated from old dashboard useRegistrations hook
 * Handles academy registrations
 */
@Injectable({
  providedIn: 'root'
})
export class RegistrationsService {
  private supabase = inject(SupabaseService);

  /**
   * Get all registrations, ordered by creation date descending
   */
  getRegistrations(): Observable<Registration[]> {
    return from(
      this.supabase.client
        .from('academy_registrations')
        .select('*')
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapRegistrationFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching registrations:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get a single registration by ID
   */
  getRegistrationById(id: string): Observable<Registration | null> {
    return from(
      this.supabase.client
        .from('academy_registrations')
        .select('*')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) {
          if (error.code === 'PGRST116') return null; // Not found
          throw error;
        }
        return data ? this.mapRegistrationFromDb(data) : null;
      })
    );
  }

  /**
   * Create a new registration
   */
  createRegistration(registrationData: Omit<Registration, 'id' | 'createdAt' | 'updatedAt'>): Observable<string> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('academy_registrations')
        .insert({
          first_name: registrationData.firstName,
          last_name: registrationData.lastName,
          cell_number: registrationData.cellNumber,
          email: registrationData.email,
          city: registrationData.city,
          state: registrationData.state,
          birthday: registrationData.birthday,
          gender: registrationData.gender,
          confirm_email: registrationData.confirmEmail,
          address: registrationData.address,
          zip_code: registrationData.zipCode,
          age: registrationData.age,
          first_period: registrationData.firstPeriod,
          second_period: registrationData.secondPeriod,
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
   * Update a registration
   */
  updateRegistration(id: string, updates: Partial<Registration>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.firstName !== undefined) updateData.first_name = updates.firstName;
    if (updates.lastName !== undefined) updateData.last_name = updates.lastName;
    if (updates.email !== undefined) updateData.email = updates.email;
    if (updates.confirmEmail !== undefined) updateData.confirm_email = updates.confirmEmail;
    if (updates.cellNumber !== undefined) updateData.cell_number = updates.cellNumber;
    if (updates.city !== undefined) updateData.city = updates.city;
    if (updates.state !== undefined) updateData.state = updates.state;
    if (updates.birthday !== undefined) updateData.birthday = updates.birthday;
    if (updates.gender !== undefined) updateData.gender = updates.gender;
    if (updates.address !== undefined) updateData.address = updates.address;
    if (updates.zipCode !== undefined) updateData.zip_code = updates.zipCode;
    if (updates.age !== undefined) updateData.age = updates.age;
    if (updates.firstPeriod !== undefined) updateData.first_period = updates.firstPeriod;
    if (updates.secondPeriod !== undefined) updateData.second_period = updates.secondPeriod;

    return from(
      this.supabase.client
        .from('academy_registrations')
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
   * Delete a registration
   */
  deleteRegistration(id: string): Observable<boolean> {
    return from(
      this.supabase.client
        .from('academy_registrations')
        .delete()
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  // Helper method for mapping database records to types

  private mapRegistrationFromDb(data: any): Registration {
    return {
      id: data.id,
      firstName: data.first_name,
      lastName: data.last_name,
      cellNumber: data.cell_number,
      email: data.email,
      city: data.city,
      state: data.state,
      birthday: data.birthday,
      gender: data.gender,
      confirmEmail: data.confirm_email,
      address: data.address,
      zipCode: data.zip_code,
      age: data.age,
      firstPeriod: data.first_period,
      secondPeriod: data.second_period,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }
}

