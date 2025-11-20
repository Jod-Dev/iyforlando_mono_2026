import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-volunteer-opportunities',
    standalone: true,
    imports: [CommonModule],
    template: `
        <div class="p-8">
            <h1 class="text-3xl font-bold mb-6">Volunteer Opportunities</h1>
            <p class="text-gray-600">This is a placeholder for volunteer opportunities.</p>
        </div>
    `,
})
export class VolunteerOpportunitiesComponent {}

