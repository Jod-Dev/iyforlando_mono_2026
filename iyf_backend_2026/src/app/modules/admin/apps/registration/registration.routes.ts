import { Routes } from '@angular/router';
import { RegistrationComponent } from 'app/modules/admin/apps/registration/registration.component';
import { RegistrationListComponent } from 'app/modules/admin/apps/registration/list/list.component';
import { RegistrationFormComponent } from 'app/modules/admin/apps/registration/form/form.component';

export default [
    {
        path: '',
        component: RegistrationComponent,
        children: [
            {
                path: '',
                pathMatch: 'full',
                component: RegistrationListComponent,
            },
            {
                path: 'new',
                component: RegistrationFormComponent,
            },
            {
                path: ':id/edit',
                component: RegistrationFormComponent,
            },
        ],
    },
] as Routes;

