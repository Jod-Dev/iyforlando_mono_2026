import { Route } from '@angular/router';

/**
 * Student Module Routes
 * 
 * Routes for student-facing features:
 * - View available courses
 * - Register for courses
 * - View my courses
 * - View events
 * - Register for events
 */
export const studentRoutes: Route[] = [
    {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full',
    },
    {
        path: 'dashboard',
        loadComponent: () => import('./dashboard/dashboard.component').then(m => m.StudentDashboardComponent),
        title: 'Student Dashboard',
    },
    {
        path: 'courses',
        loadChildren: () => import('./courses/courses.routes').then(m => m.coursesRoutes),
    },
    {
        path: 'events',
        loadChildren: () => import('./events/events.routes').then(m => m.eventsRoutes),
    },
    {
        path: 'profile',
        loadComponent: () => import('./profile/profile.component').then(m => m.StudentProfileComponent),
        title: 'My Profile',
    },
];

