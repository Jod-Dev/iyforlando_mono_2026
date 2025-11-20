import {
    HttpErrorResponse,
    HttpEvent,
    HttpHandlerFn,
    HttpRequest,
} from '@angular/common/http';
import { inject } from '@angular/core';
import { AuthService } from 'app/core/auth/auth.service';
import { AuthUtils } from 'app/core/auth/auth.utils';
import { SupabaseService } from 'app/core/supabase/supabase.service';
import { Observable, catchError, from, switchMap, throwError } from 'rxjs';

/**
 * Intercept HTTP requests to add Supabase auth token
 * 
 * For Supabase REST API calls, we need to add the access token.
 * Note: Supabase client library handles auth automatically, but if we make
 * direct HTTP calls to Supabase REST API, we need this interceptor.
 *
 * @param req
 * @param next
 */
export const authInterceptor = (
    req: HttpRequest<unknown>,
    next: HttpHandlerFn
): Observable<HttpEvent<unknown>> => {
    const authService = inject(AuthService);
    const supabase = inject(SupabaseService);

    // Clone the request object
    let newReq = req.clone();

    // Check if this is a request to Supabase API
    const isSupabaseRequest = req.url.includes('supabase.co');

    // For Supabase requests, get the current session token
    if (isSupabaseRequest) {
        return from(supabase.client.auth.getSession()).pipe(
            switchMap(({ data: { session } }) => {
                if (session?.access_token) {
                    // Add Supabase auth token
                    newReq = req.clone({
                        headers: req.headers.set(
                            'Authorization',
                            'Bearer ' + session.access_token
                        ),
                    });
                }

                return next(newReq).pipe(
                    catchError((error) => {
                        // Catch "401 Unauthorized" responses
                        if (error instanceof HttpErrorResponse && error.status === 401) {
                            // Sign out
                            authService.signOut().subscribe(() => {
                                // Reload the app
                                location.reload();
                            });
                        }

                        return throwError(() => error);
                    })
                );
            })
        );
    }

    // For other requests, use the existing token logic
    // (This is for backward compatibility with any non-Supabase APIs)
    if (
        authService.accessToken &&
        !AuthUtils.isTokenExpired(authService.accessToken)
    ) {
        newReq = req.clone({
            headers: req.headers.set(
                'Authorization',
                'Bearer ' + authService.accessToken
            ),
        });
    }

    // Response
    return next(newReq).pipe(
        catchError((error) => {
            // Catch "401 Unauthorized" responses
            if (error instanceof HttpErrorResponse && error.status === 401) {
                // Sign out
                authService.signOut().subscribe(() => {
                    // Reload the app
                    location.reload();
                });
            }

            return throwError(() => error);
        })
    );
};
