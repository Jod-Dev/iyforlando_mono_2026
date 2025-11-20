import { Route } from '@angular/router';

/**
 * Student Events Routes
 */
export const eventsRoutes: Route[] = [
    {
        path: '',
        loadComponent: () => import('./list/list.component').then(m => m.StudentEventsListComponent),
        title: 'Upcoming Events',
    },
    {
        path: 'my-events',
        loadComponent: () => import('./my-events/my-events.component').then(m => m.MyEventsComponent),
        title: 'My Events',
    },
    {
        path: ':id',
        loadComponent: () => import('./details/details.component').then(m => m.EventDetailsComponent),
        title: 'Event Details',
    },
];

