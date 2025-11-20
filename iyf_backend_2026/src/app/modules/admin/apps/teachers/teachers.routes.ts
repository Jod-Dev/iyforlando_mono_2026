import { Routes } from '@angular/router';
import { TeachersComponent } from 'app/modules/admin/apps/teachers/teachers.component';
import { TeachersListComponent } from 'app/modules/admin/apps/teachers/list/list.component';
import { TeacherFormComponent } from 'app/modules/admin/apps/teachers/form/form.component';

export default [
    {
        path: '',
        component: TeachersComponent,
        children: [
            {
                path: '',
                pathMatch: 'full',
                component: TeachersListComponent,
            },
            {
                path: 'new',
                component: TeacherFormComponent,
            },
            {
                path: ':id/edit',
                component: TeacherFormComponent,
            },
        ],
    },
] as Routes;

