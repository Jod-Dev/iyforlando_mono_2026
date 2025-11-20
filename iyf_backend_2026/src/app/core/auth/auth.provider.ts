import { provideHttpClient, withInterceptors } from '@angular/common/http';
import {
    EnvironmentProviders,
    Provider,
    inject,
    provideEnvironmentInitializer,
} from '@angular/core';
import { authInterceptor } from 'app/core/auth/auth.interceptor';
import { errorInterceptor } from 'app/core/http/error.interceptor';
import { AuthService } from 'app/core/auth/auth.service';

export const provideAuth = (): Array<Provider | EnvironmentProviders> => {
    return [
        // Register both auth and error interceptors
        // Order matters: error interceptor should be last to catch all errors
        provideHttpClient(withInterceptors([authInterceptor, errorInterceptor])),
        provideEnvironmentInitializer(() => inject(AuthService)),
    ];
};
