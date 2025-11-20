import { Injectable } from '@angular/core';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import { environment } from '../../../environments/environment';

/**
 * Supabase Service
 * 
 * Singleton service that provides the configured Supabase client.
 * 
 * ⚠️ IMPORTANT: This service uses the Anon Key which is safe for the frontend.
 * The Service Role Key should NEVER be used here.
 */
@Injectable({
  providedIn: 'root'
})
export class SupabaseService {
  private _client: SupabaseClient | null = null;

  /**
   * Gets the Supabase client (singleton)
   */
  get client(): SupabaseClient {
    if (!this._client) {
      this._client = this.createClient();
    }
    return this._client;
  }

  /**
   * Creates a new instance of the Supabase client
   */
  private createClient(): SupabaseClient {
    const supabaseUrl = environment.supabaseUrl;
    const supabaseAnonKey = environment.supabaseAnonKey;

    // Configuration validation
    if (!supabaseUrl || !supabaseAnonKey) {
      throw new Error(
        'Supabase configuration is missing. ' +
        'Please check your environment variables: SUPABASE_URL and SUPABASE_ANON_KEY'
      );
    }

    // Extract project ref from URL to create unique storage key
    const projectRef = supabaseUrl.split('//')[1]?.split('.')[0] || 'default';

    // Create a custom storage adapter that uses sessionStorage to avoid lock conflicts
    const customStorage = typeof window !== 'undefined' ? {
      getItem: (key: string) => {
        try {
          return sessionStorage.getItem(key);
        } catch (e) {
          console.warn('Error reading from sessionStorage:', e);
          return null;
        }
      },
      setItem: (key: string, value: string) => {
        try {
          sessionStorage.setItem(key, value);
        } catch (e) {
          console.warn('Error writing to sessionStorage:', e);
        }
      },
      removeItem: (key: string) => {
        try {
          sessionStorage.removeItem(key);
        } catch (e) {
          console.warn('Error removing from sessionStorage:', e);
        }
      }
    } : undefined;

    return createClient(supabaseUrl, supabaseAnonKey, {
      auth: {
        autoRefreshToken: true,
        persistSession: true,
        detectSessionInUrl: true,
        storage: customStorage,
        storageKey: `sb-${projectRef}-auth-token`,
        // Use PKCE flow to reduce lock conflicts
        flowType: 'pkce'
      },
      // Global configuration to handle lock errors gracefully
      global: {
        headers: {
          'x-client-info': 'iyf-orlando-platform'
        }
      }
    });
  }

  /**
   * Gets the current authenticated user
   */
  async getCurrentUser() {
    const { data: { user }, error } = await this.client.auth.getUser();
    if (error) {
      console.error('Error getting current user:', error);
      return null;
    }
    return user;
  }

  /**
   * Signs out the current user
   */
  async signOut() {
    const { error } = await this.client.auth.signOut();
    if (error) {
      console.error('Error signing out:', error);
      throw error;
    }
  }
}

