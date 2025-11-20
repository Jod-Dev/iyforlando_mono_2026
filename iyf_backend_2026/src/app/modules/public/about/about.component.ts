import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-about',
    standalone: true,
    imports: [CommonModule],
    template: `
        <div class="p-8">
            <h1 class="text-3xl font-bold mb-6">About IYF Orlando</h1>
            <p class="text-gray-600">This is a placeholder for the about page.</p>
        </div>
    `,
})
export class AboutComponent {}

