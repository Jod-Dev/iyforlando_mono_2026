import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

/**
 * Student Dashboard Component
 * 
 * Main dashboard for students showing:
 * - Enrolled courses
 * - Upcoming events
 * - Registration status
 */
@Component({
    selector: 'app-student-dashboard',
    standalone: true,
    imports: [CommonModule],
    template: `
        <div class="p-8">
            <h1 class="text-3xl font-bold mb-6">Student Dashboard</h1>
            <p class="text-gray-600">This is a placeholder for the student dashboard.</p>
            <p class="text-gray-600 mt-2">Features to be implemented:</p>
            <ul class="list-disc list-inside mt-4 space-y-2 text-gray-600">
                <li>My enrolled courses</li>
                <li>Upcoming events</li>
                <li>Registration status</li>
                <li>Notifications</li>
            </ul>
        </div>
    `,
})
export class StudentDashboardComponent {}

