import { Routes } from '@angular/router';
import { AcademyComponent } from 'app/modules/admin/apps/academy/academy.component';
import { AcademyListComponent } from 'app/modules/admin/apps/academy/list/list.component';
import { AcademyFormComponent } from 'app/modules/admin/apps/academy/form/form.component';

export default [
    {
        path: '',
        component: AcademyComponent,
        children: [
            {
                path: '',
                pathMatch: 'full',
                component: AcademyListComponent,
            },
            {
                path: 'new',
                component: AcademyFormComponent,
            },
            {
                path: ':id/edit',
                component: AcademyFormComponent,
            },
        ],
    },
] as Routes;
