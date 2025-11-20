import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { AuthUtils } from 'app/core/auth/auth.utils';
import { UserService } from 'app/core/user/user.service';
import { SupabaseService } from '../supabase/supabase.service';
import { catchError, from, Observable, of, switchMap, throwError } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AuthService {
    private _authenticated: boolean = false;
    private _httpClient = inject(HttpClient);
    private _userService = inject(UserService);
    private _supabase = inject(SupabaseService);

    // -----------------------------------------------------------------------------------------------------
    // @ Accessors
    // -----------------------------------------------------------------------------------------------------

    /**
     * Setter & getter for access token
     */
    set accessToken(token: string) {
        localStorage.setItem('accessToken', token);
    }

    get accessToken(): string {
        return localStorage.getItem('accessToken') ?? '';
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Forgot password using Supabase Auth
     *
     * @param email
     */
    forgotPassword(email: string): Observable<any> {
        return from(
            this._supabase.client.auth.resetPasswordForEmail(email, {
                redirectTo: `${window.location.origin}/pages/authentication/reset-password`,
            })
        ).pipe(
            switchMap(({ data, error }) => {
                if (error) {
                    return throwError(() => error);
                }
                return of(data);
            })
        );
    }

    /**
     * Reset password using Supabase Auth
     *
     * @param password
     */
    resetPassword(password: string): Observable<any> {
        return from(
            this._supabase.client.auth.updateUser({
                password: password,
            })
        ).pipe(
            switchMap(({ data, error }) => {
                if (error) {
                    return throwError(() => error);
                }
                return of(data);
            })
        );
    }

    /**
     * Sign in using Supabase Auth
     *
     * @param credentials
     */
    signIn(credentials: { email: string; password: string }): Observable<any> {
        // Throw error, if the user is already logged in
        if (this._authenticated) {
            return throwError(() => new Error('User is already logged in.'));
        }

        // Use Supabase Auth for sign in
        return from(
            this._supabase.client.auth.signInWithPassword({
                email: credentials.email,
                password: credentials.password,
            })
        ).pipe(
            switchMap(({ data, error }) => {
                if (error) {
                    // Provide more helpful error messages
                    let errorMessage = error.message;
                    if (error.status === 400) {
                        if (error.message?.includes('Invalid login credentials')) {
                            errorMessage = 'Invalid email or password. Please check your credentials.';
                        } else if (error.message?.includes('Email not confirmed')) {
                            errorMessage = 'Please confirm your email address before signing in.';
                        } else {
                            errorMessage = 'Login failed. Please check your email and password.';
                        }
                    }
                    console.error('Login error:', error);
                    return throwError(() => new Error(errorMessage));
                }

                if (!data.session || !data.user) {
                    return throwError(() => new Error('No session or user data returned'));
                }

                // Store the access token in the local storage
                this.accessToken = data.session.access_token;

                // Set the authenticated flag to true
                this._authenticated = true;

                // Get user profile from Supabase
                return from(this.getUserProfile(data.user.id)).pipe(
                    switchMap((profile) => {
                        // Store the user on the user service
                        const userData = {
                            id: data.user.id,
                            email: data.user.email,
                            name: profile?.first_name + ' ' + profile?.last_name || data.user.email,
                            avatar: null,
                            status: profile?.status || 'active',
                            role: profile?.role || 'student',
                        };
                        this._userService.user = userData;

                        // Return response in expected format
                        return of({
                            accessToken: data.session.access_token,
                            user: userData,
                        });
                    })
                );
            })
        );
    }

    /**
     * Get user profile from Supabase
     */
    private async getUserProfile(userId: string): Promise<any> {
        const { data, error } = await this._supabase.client
            .from('profiles')
            .select('*')
            .eq('id', userId)
            .single();

        if (error) {
            console.warn('Error fetching user profile:', error);
            return null;
        }

        return data;
    }

    /**
     * Sign in using the access token (check existing Supabase session)
     */
    signInUsingToken(): Observable<any> {
        // Check if there's an existing Supabase session
        return from(this._supabase.client.auth.getSession()).pipe(
            catchError(() => of({ data: { session: null }, error: null })),
            switchMap(({ data, error }) => {
                if (error || !data.session) {
                    return of(false);
                }

                // Update access token from session
                this.accessToken = data.session.access_token;

                // Set the authenticated flag to true
                this._authenticated = true;

                // Get user profile
                return from(this.getUserProfile(data.session.user.id)).pipe(
                    switchMap((profile) => {
                        const userData = {
                            id: data.session.user.id,
                            email: data.session.user.email,
                            name: profile?.first_name + ' ' + profile?.last_name || data.session.user.email,
                            avatar: null,
                            status: profile?.status || 'active',
                            role: profile?.role || 'student',
                        };
                        this._userService.user = userData;

                        return of(true);
                    })
                );
            })
        );
    }

    /**
     * Sign out using Supabase Auth
     */
    signOut(): Observable<any> {
        // Sign out from Supabase
        return from(this._supabase.client.auth.signOut()).pipe(
            switchMap(() => {
                // Remove the access token from the local storage
                localStorage.removeItem('accessToken');

                // Set the authenticated flag to false
                this._authenticated = false;

                // Clear user service
                this._userService.user = null;

                // Return the observable
                return of(true);
            }),
            catchError((error) => {
                // Even if Supabase sign out fails, clear local state
                localStorage.removeItem('accessToken');
                this._authenticated = false;
                this._userService.user = null;
                console.error('Error signing out:', error);
                return of(true);
            })
        );
    }

    /**
     * Sign up using Supabase Auth
     *
     * @param user
     */
    signUp(user: {
        name: string;
        email: string;
        password: string;
        company?: string;
    }): Observable<any> {
        // Split name into first and last name
        const nameParts = user.name.trim().split(' ');
        const firstName = nameParts[0] || '';
        const lastName = nameParts.slice(1).join(' ') || '';

        // Use Supabase Auth for sign up
        return from(
            this._supabase.client.auth.signUp({
                email: user.email,
                password: user.password,
                options: {
                    data: {
                        first_name: firstName,
                        last_name: lastName,
                    },
                },
            })
        ).pipe(
            switchMap(({ data, error }) => {
                if (error) {
                    return throwError(() => error);
                }

                // Return success response
                // Note: Supabase will send a confirmation email if email confirmation is enabled
                return of({
                    user: data.user,
                    session: data.session,
                    needsEmailConfirmation: !data.session, // If no session, email confirmation is required
                });
            })
        );
    }

    /**
     * Unlock session
     *
     * @param credentials
     */
    unlockSession(credentials: {
        email: string;
        password: string;
    }): Observable<any> {
        return this._httpClient.post('api/auth/unlock-session', credentials);
    }

    /**
     * Check the authentication status
     */
    check(): Observable<boolean> {
        // Check if the user is logged in
        if (this._authenticated) {
            return of(true);
        }

        // Check the access token availability
        if (!this.accessToken) {
            return of(false);
        }

        // Check the access token expire date
        if (AuthUtils.isTokenExpired(this.accessToken)) {
            return of(false);
        }

        // If the access token exists, and it didn't expire, sign in using it
        return this.signInUsingToken();
    }
}
