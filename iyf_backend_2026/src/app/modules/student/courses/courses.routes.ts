import { Route } from '@angular/router';

/**
 * Student Courses Routes
 */
export const coursesRoutes: Route[] = [
    {
        path: '',
        loadComponent: () => import('./list/list.component').then(m => m.StudentCoursesListComponent),
        title: 'Available Courses',
    },
    {
        path: 'my-courses',
        loadComponent: () => import('./my-courses/my-courses.component').then(m => m.MyCoursesComponent),
        title: 'My Courses',
    },
    {
        path: ':id',
        loadComponent: () => import('./details/details.component').then(m => m.CourseDetailsComponent),
        title: 'Course Details',
    },
];

