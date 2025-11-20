import { Route } from '@angular/router';

/**
 * Volunteer Module Routes
 * 
 * Routes for volunteer-facing features:
 * - View volunteer opportunities
 * - Register as volunteer
 * - View my volunteer assignments
 * - Track volunteer hours
 */
export const volunteerRoutes: Route[] = [
    {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full',
    },
    {
        path: 'dashboard',
        loadComponent: () => import('./dashboard/dashboard.component').then(m => m.VolunteerDashboardComponent),
        title: 'Volunteer Dashboard',
    },
    {
        path: 'opportunities',
        loadComponent: () => import('./opportunities/opportunities.component').then(m => m.VolunteerOpportunitiesComponent),
        title: 'Volunteer Opportunities',
    },
    {
        path: 'assignments',
        loadComponent: () => import('./assignments/assignments.component').then(m => m.VolunteerAssignmentsComponent),
        title: 'My Assignments',
    },
    {
        path: 'profile',
        loadComponent: () => import('./profile/profile.component').then(m => m.VolunteerProfileComponent),
        title: 'Volunteer Profile',
    },
];

