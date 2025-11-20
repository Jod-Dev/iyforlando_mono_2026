import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Teacher, TeacherFormData } from '../types/teachers.types';
import { Observable, from, map, catchError, throwError } from 'rxjs';

/**
 * Teachers Service
 * Handles CRUD operations for teachers using Supabase
 */
@Injectable({
  providedIn: 'root'
})
export class TeachersService {
  private _supabase = inject(SupabaseService);

  /**
   * Get all teachers
   * @param includeInactive - If true, includes inactive teachers (admin only)
   */
  getAll(includeInactive: boolean = false): Observable<Teacher[]> {
    let query = this._supabase.client
      .from('teachers')
      .select('*')
      .order('first_name', { ascending: true });

    if (!includeInactive) {
      query = query.eq('status', 'active');
    }

    return from(query).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapTeachersFromDB(data || []);
      }),
      catchError((error) => {
        console.error('Error fetching teachers:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get teacher by ID
   */
  getById(id: string): Observable<Teacher> {
    return from(
      this._supabase.client
        .from('teachers')
        .select('*')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapTeacherFromDB(data);
      }),
      catchError((error) => {
        console.error('Error fetching teacher:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Create a new teacher
   */
  create(teacherData: TeacherFormData): Observable<Teacher> {
    const dbData = this.mapTeacherToDB(teacherData);
    
    return from(
      this._supabase.client
        .from('teachers')
        .insert(dbData)
        .select()
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapTeacherFromDB(data);
      }),
      catchError((error) => {
        console.error('Error creating teacher:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Update a teacher
   */
  update(id: string, teacherData: Partial<TeacherFormData>): Observable<Teacher> {
    const dbData = this.mapTeacherToDB(teacherData as TeacherFormData);
    
    return from(
      this._supabase.client
        .from('teachers')
        .update(dbData)
        .eq('id', id)
        .select()
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapTeacherFromDB(data);
      }),
      catchError((error) => {
        console.error('Error updating teacher:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Delete a teacher (hard delete)
   */
  delete(id: string): Observable<void> {
    return from(
      this._supabase.client
        .from('teachers')
        .delete()
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
      }),
      catchError((error) => {
        console.error('Error deleting teacher:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Toggle teacher status (active/inactive)
   */
  toggleStatus(id: string, status: 'active' | 'inactive'): Observable<Teacher> {
    return from(
      this._supabase.client
        .from('teachers')
        .update({ status })
        .eq('id', id)
        .select()
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapTeacherFromDB(data);
      }),
      catchError((error) => {
        console.error('Error toggling teacher status:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Map database record to Teacher interface
   */
  private mapTeacherFromDB(data: any): Teacher {
    return {
      id: data.id,
      profile_id: data.profile_id,
      first_name: data.first_name,
      last_name: data.last_name,
      email: data.email,
      phone: data.phone,
      avatar: data.avatar,
      academy_id: data.academy_id,
      academy_name: data.academy_name,
      bio: data.bio,
      status: data.status,
      created_at: data.created_at,
      updated_at: data.updated_at,
    };
  }

  /**
   * Map array of database records to Teacher array
   */
  private mapTeachersFromDB(data: any[]): Teacher[] {
    return data.map(item => this.mapTeacherFromDB(item));
  }

  /**
   * Map TeacherFormData to database format
   */
  private mapTeacherToDB(teacherData: TeacherFormData): any {
    const dbData: any = {
      first_name: teacherData.first_name,
      last_name: teacherData.last_name,
      email: teacherData.email,
    };

    if (teacherData.phone) dbData.phone = teacherData.phone;
    if (teacherData.avatar) dbData.avatar = teacherData.avatar;
    if (teacherData.academy_id) dbData.academy_id = teacherData.academy_id;
    if (teacherData.academy_name) dbData.academy_name = teacherData.academy_name;
    if (teacherData.bio) dbData.bio = teacherData.bio;
    if (teacherData.status) dbData.status = teacherData.status;

    return dbData;
  }
}

