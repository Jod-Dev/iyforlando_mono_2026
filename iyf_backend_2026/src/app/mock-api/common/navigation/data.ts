/* eslint-disable */
import { FuseNavigationItem } from '@fuse/components/navigation';

export const defaultNavigation: FuseNavigationItem[] = [
    {
        id: 'dashboards',
        title: 'Dashboard',
        subtitle: 'IYF Orlando Overview',
        type: 'group',
        icon: 'heroicons_outline:home',
        children: [
            {
                id: 'dashboards.project',
                title: 'Home',
                type: 'basic',
                icon: 'heroicons_outline:home',
                link: '/dashboards/project',
            },
            {
                id: 'dashboards.analytics',
                title: 'Analytics',
                type: 'basic',
                icon: 'heroicons_outline:chart-pie',
                link: '/dashboards/analytics',
            },
            {
                id: 'dashboards.finance',
                title: 'Payments & Invoices',
                type: 'basic',
                icon: 'heroicons_outline:currency-dollar',
                link: '/dashboards/finance',
            },
        ],
    },
    {
        id: 'apps',
        title: 'Applications',
        subtitle: 'IYF Orlando modules',
        type: 'group',
        icon: 'heroicons_outline:squares-2x2',
        children: [
            {
                id: 'apps.registration',
                title: 'Registration',
                type: 'basic',
                icon: 'heroicons_outline:clipboard-document-check',
                link: '/apps/registration',
            },
            {
                id: 'apps.academy',
                title: 'Academy',
                type: 'basic',
                icon: 'heroicons_outline:academic-cap',
                link: '/apps/academy',
            },
            {
                id: 'apps.contacts',
                title: 'Contacts',
                type: 'basic',
                icon: 'heroicons_outline:user-group',
                link: '/apps/contacts',
            },
            {
                id: 'apps.teachers',
                title: 'Teachers',
                type: 'basic',
                icon: 'heroicons_outline:academic-cap',
                link: '/apps/teachers',
            },
            {
                id: 'apps.ecommerce',
                title: 'E-Commerce',
                type: 'basic',
                icon: 'heroicons_outline:shopping-cart',
                link: '/apps/ecommerce',
            },
            // TODO: Add more IYF-specific modules here
            // - Courses
            // - Events
            // - Volunteers
            // - Students
        ],
    },
    {
        id: 'pages',
        title: 'Pages',
        subtitle: 'Custom pages',
        type: 'group',
        icon: 'heroicons_outline:document',
        children: [
            {
                id: 'pages.authentication',
                title: 'Authentication',
                type: 'collapsable',
                icon: 'heroicons_outline:lock-closed',
                children: [
                    {
                        id: 'pages.authentication.sign-in',
                        title: 'Sign in',
                        type: 'basic',
                        link: '/pages/authentication/sign-in/modern',
                    },
                    {
                        id: 'pages.authentication.sign-up',
                        title: 'Sign up',
                        type: 'basic',
                        link: '/pages/authentication/sign-up/modern',
                    },
                    {
                        id: 'pages.authentication.forgot-password',
                        title: 'Forgot password',
                        type: 'basic',
                        link: '/pages/authentication/forgot-password/modern',
                    },
                    {
                        id: 'pages.authentication.reset-password',
                        title: 'Reset password',
                        type: 'basic',
                        link: '/pages/authentication/reset-password/modern',
                    },
                ],
            },
            {
                id: 'pages.error',
                title: 'Error',
                type: 'collapsable',
                icon: 'heroicons_outline:exclamation-circle',
                children: [
                    {
                        id: 'pages.error.404',
                        title: '404',
                        type: 'basic',
                        link: '/pages/error/404',
                    },
                    {
                        id: 'pages.error.500',
                        title: '500',
                        type: 'basic',
                        link: '/pages/error/500',
                    },
                ],
            },
            {
                id: 'pages.profile',
                title: 'Profile',
                type: 'basic',
                icon: 'heroicons_outline:user-circle',
                link: '/pages/profile',
            },
            {
                id: 'pages.settings',
                title: 'Settings',
                type: 'basic',
                icon: 'heroicons_outline:cog-8-tooth',
                link: '/pages/settings',
            },
        ],
    },
];

export const compactNavigation: FuseNavigationItem[] = [
    {
        id: 'dashboards',
        title: 'Dashboards',
        tooltip: 'Dashboards',
        type: 'aside',
        icon: 'heroicons_outline:home',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'apps',
        title: 'Apps',
        tooltip: 'Apps',
        type: 'aside',
        icon: 'heroicons_outline:squares-2x2',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'pages',
        title: 'Pages',
        tooltip: 'Pages',
        type: 'aside',
        icon: 'heroicons_outline:document-duplicate',
        children: [], // This will be filled from defaultNavigation
    },
];

export const futuristicNavigation: FuseNavigationItem[] = [
    {
        id: 'dashboards',
        title: 'DASHBOARDS',
        type: 'group',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'apps',
        title: 'APPS',
        type: 'group',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'pages',
        title: 'Pages',
        type: 'aside',
        icon: 'heroicons_outline:document-duplicate',
        children: [], // This will be filled from defaultNavigation
    },
];

export const horizontalNavigation: FuseNavigationItem[] = [
    {
        id: 'dashboards',
        title: 'Dashboards',
        type: 'group',
        icon: 'heroicons_outline:home',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'apps',
        title: 'Apps',
        type: 'group',
        icon: 'heroicons_outline:squares-2x2',
        children: [], // This will be filled from defaultNavigation
    },
    {
        id: 'pages',
        title: 'Pages',
        type: 'group',
        icon: 'heroicons_outline:document-duplicate',
        children: [], // This will be filled from defaultNavigation
    },
];
