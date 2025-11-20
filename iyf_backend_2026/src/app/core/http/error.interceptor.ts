import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';

/**
 * HTTP Error Interceptor
 * 
 * Handles HTTP errors globally and redirects to appropriate error pages:
 * - 404 errors: Redirect to 404 page
 * - 500 errors: Redirect to 500 page
 * - Other errors: Log and rethrow
 */
export const errorInterceptor: HttpInterceptorFn = (req, next) => {
    const router = inject(Router);

    return next(req).pipe(
        catchError((error: HttpErrorResponse) => {
            // Don't intercept errors for Supabase auth endpoints
            // (they have their own error handling)
            if (req.url.includes('supabase.co/auth/v1')) {
                return throwError(() => error);
            }

            // Get current URL to avoid redirect loops
            const currentUrl = router.url;

            // Handle different error status codes
            switch (error.status) {
                case 404:
                    // Only redirect to 404 if it's not already an error page
                    if (!currentUrl.includes('404-not-found') && !currentUrl.includes('500-server-error')) {
                        router.navigate(['/404-not-found'], { skipLocationChange: false });
                    }
                    break;

                case 500:
                case 502:
                case 503:
                case 504:
                    // Server errors - redirect to 500 page
                    if (!currentUrl.includes('500-server-error') && !currentUrl.includes('404-not-found')) {
                        router.navigate(['/500-server-error'], { skipLocationChange: false });
                    }
                    break;

                case 401:
                    // Unauthorized - handled by auth interceptor
                    // Don't redirect here, let auth interceptor handle it
                    break;

                case 403:
                    // Forbidden - log but don't redirect
                    console.error('Access forbidden:', error);
                    break;

                default:
                    // Log other errors (but don't redirect for client errors like 400)
                    if (error.status >= 500) {
                        // Only redirect for server errors
                        if (!currentUrl.includes('500-server-error') && !currentUrl.includes('404-not-found')) {
                            router.navigate(['/500-server-error'], { skipLocationChange: false });
                        }
                    } else {
                        console.error('HTTP Error:', error);
                    }
                    break;
            }

            // Re-throw the error so components can handle it if needed
            return throwError(() => error);
        })
    );
};

