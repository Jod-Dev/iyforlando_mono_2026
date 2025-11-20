import { Component, ViewEncapsulation } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
    selector: 'teachers',
    template: '<router-outlet></router-outlet>',
    encapsulation: ViewEncapsulation.None,
    imports: [RouterOutlet],
})
export class TeachersComponent {}

