import { Route } from '@angular/router';

/**
 * Public Module Routes
 * 
 * Routes for public-facing (unauthenticated) features:
 * - Home/Landing page
 * - Public course listings
 * - Public event listings
 * - About IYF Orlando
 */
export const publicRoutes: Route[] = [
    {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full',
    },
    {
        path: 'home',
        loadComponent: () => import('./home/home.component').then(m => m.PublicHomeComponent),
        title: 'IYF Orlando - Home',
    },
    {
        path: 'courses',
        loadComponent: () => import('./courses/courses.component').then(m => m.PublicCoursesComponent),
        title: 'Available Courses',
    },
    {
        path: 'events',
        loadComponent: () => import('./events/events.component').then(m => m.PublicEventsComponent),
        title: 'Upcoming Events',
    },
    {
        path: 'about',
        loadComponent: () => import('./about/about.component').then(m => m.AboutComponent),
        title: 'About IYF Orlando',
    },
];

