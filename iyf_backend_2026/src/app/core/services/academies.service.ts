import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Academy, AcademyFormData } from '../types/academies.types';
import { Observable, from, map, catchError, throwError } from 'rxjs';

/**
 * Academies Service
 * Handles CRUD operations for academies using Supabase
 */
@Injectable({
  providedIn: 'root'
})
export class AcademiesService {
  private _supabase = inject(SupabaseService);

  /**
   * Get all academies
   * @param includeInactive - If true, includes inactive academies (admin only)
   */
  getAll(includeInactive: boolean = false): Observable<Academy[]> {
    let query = this._supabase.client
      .from('academies')
      .select('*')
      .order('title', { ascending: true });

    if (!includeInactive) {
      query = query.eq('status', 'active');
    }

    return from(query).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapAcademiesFromDB(data || []);
      }),
      catchError((error) => {
        console.error('Error fetching academies:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get academy by ID
   */
  getById(id: string): Observable<Academy> {
    return from(
      this._supabase.client
        .from('academies')
        .select('*')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapAcademyFromDB(data);
      }),
      catchError((error) => {
        console.error('Error fetching academy:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get academy by link name
   */
  getByLinkName(linkName: string): Observable<Academy> {
    return from(
      this._supabase.client
        .from('academies')
        .select('*')
        .eq('link_name', linkName)
        .eq('status', 'active')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapAcademyFromDB(data);
      }),
      catchError((error) => {
        console.error('Error fetching academy by link name:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Create a new academy
   */
  create(academy: AcademyFormData): Observable<Academy> {
    const dbData = this.mapAcademyToDB(academy);
    
    return from(
      this._supabase.client
        .from('academies')
        .insert(dbData)
        .select()
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapAcademyFromDB(data);
      }),
      catchError((error) => {
        console.error('Error creating academy:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Update an existing academy
   */
  update(id: string, academy: Partial<AcademyFormData>): Observable<Academy> {
    const dbData = this.mapAcademyToDB(academy as AcademyFormData);
    
    return from(
      this._supabase.client
        .from('academies')
        .update(dbData)
        .eq('id', id)
        .select()
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return this.mapAcademyFromDB(data);
      }),
      catchError((error) => {
        console.error('Error updating academy:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Delete an academy (soft delete by setting status to inactive)
   */
  delete(id: string): Observable<void> {
    return from(
      this._supabase.client
        .from('academies')
        .update({ status: 'inactive' })
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
      }),
      catchError((error) => {
        console.error('Error deleting academy:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Hard delete an academy (permanent removal)
   */
  hardDelete(id: string): Observable<void> {
    return from(
      this._supabase.client
        .from('academies')
        .delete()
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
      }),
      catchError((error) => {
        console.error('Error hard deleting academy:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Map academy from database format to TypeScript format
   */
  private mapAcademyFromDB(data: any): Academy {
    return {
      id: data.id,
      title: data.title || data.name || '',
      description: data.description || '',
      price: data.price || '',
      level: data.level || '',
      age: data.age || '',
      schedule: Array.isArray(data.schedule) ? data.schedule : [],
      image: data.image || '',
      tag: data.tag || '',
      catchPhrase: data.catch_phrase || '',
      goal: Array.isArray(data.goal) ? data.goal : [],
      equipment: data.equipment || '',
      academyDetailsImg: data.academy_details_img || data.image || '',
      linkName: data.link_name || '',
      note: Array.isArray(data.note) ? data.note : [],
      status: data.status || 'active',
      created_at: data.created_at,
      updated_at: data.updated_at
    };
  }

  /**
   * Map academies array from database format
   */
  private mapAcademiesFromDB(data: any[]): Academy[] {
    return data.map(item => this.mapAcademyFromDB(item));
  }

  /**
   * Map academy from TypeScript format to database format
   */
  private mapAcademyToDB(academy: AcademyFormData | Partial<AcademyFormData>): any {
    const dbData: any = {};

    // Map title to both name and title (name is required, title is the new field)
    if (academy.title !== undefined) {
      dbData.name = academy.title;
      dbData.title = academy.title;
    }
    if (academy.description !== undefined) dbData.description = academy.description;
    if (academy.price !== undefined) dbData.price = academy.price;
    if (academy.level !== undefined) dbData.level = academy.level;
    if (academy.age !== undefined) dbData.age = academy.age;
    if (academy.schedule !== undefined) dbData.schedule = academy.schedule;
    if (academy.image !== undefined) dbData.image = academy.image;
    if (academy.tag !== undefined) dbData.tag = academy.tag;
    if (academy.catchPhrase !== undefined) dbData.catch_phrase = academy.catchPhrase;
    if (academy.goal !== undefined) dbData.goal = academy.goal;
    if (academy.equipment !== undefined) dbData.equipment = academy.equipment;
    if (academy.academyDetailsImg !== undefined) dbData.academy_details_img = academy.academyDetailsImg;
    if (academy.linkName !== undefined) dbData.link_name = academy.linkName;
    if (academy.note !== undefined) dbData.note = academy.note;
    if (academy.status !== undefined) dbData.status = academy.status;

    return dbData;
  }
}

