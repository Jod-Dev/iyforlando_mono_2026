import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
    selector: 'app-public-home',
    standalone: true,
    imports: [CommonModule, RouterLink],
    template: `
        <div class="p-8">
            <h1 class="text-4xl font-bold mb-6">Welcome to IYF Orlando</h1>
            <p class="text-lg text-gray-600 mb-8">
                Join our academies, participate in events, and make a difference in our community.
            </p>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="p-6 bg-blue-50 rounded-lg">
                    <h2 class="text-2xl font-semibold mb-4">Academies</h2>
                    <p class="text-gray-600 mb-4">Explore our semester-based academies and courses.</p>
                    <a routerLink="/public/courses" class="text-blue-600 hover:underline">View Courses →</a>
                </div>
                <div class="p-6 bg-green-50 rounded-lg">
                    <h2 class="text-2xl font-semibold mb-4">Events</h2>
                    <p class="text-gray-600 mb-4">Join our upcoming events and activities.</p>
                    <a routerLink="/public/events" class="text-green-600 hover:underline">View Events →</a>
                </div>
            </div>
        </div>
    `,
})
export class PublicHomeComponent {}

