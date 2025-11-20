import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-my-courses',
    standalone: true,
    imports: [CommonModule],
    template: `
        <div class="p-8">
            <h1 class="text-3xl font-bold mb-6">My Courses</h1>
            <p class="text-gray-600">This is a placeholder for my enrolled courses.</p>
        </div>
    `,
})
export class MyCoursesComponent {}

