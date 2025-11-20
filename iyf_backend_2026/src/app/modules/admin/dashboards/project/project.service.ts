import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { BehaviorSubject, Observable, tap, forkJoin, map } from 'rxjs';
import { TeachersService } from 'app/core/services/teachers.service';
import { RegistrationsService } from 'app/core/services/registrations.service';

@Injectable({ providedIn: 'root' })
export class ProjectService {
    private _data: BehaviorSubject<any> = new BehaviorSubject(null);
    private _teachersService = inject(TeachersService);
    private _registrationsService = inject(RegistrationsService);

    /**
     * Constructor
     */
    constructor(private _httpClient: HttpClient) {}

    // -----------------------------------------------------------------------------------------------------
    // @ Accessors
    // -----------------------------------------------------------------------------------------------------

    /**
     * Getter for data
     */
    get data$(): Observable<any> {
        return this._data.asObservable();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Get data
     */
    getData(): Observable<any> {
        // Load mock data, real teachers, and registrations
        return forkJoin({
            mockData: this._httpClient.get('api/dashboards/project'),
            teachers: this._teachersService.getAll(true), // Include inactive for admin
            registrations: this._registrationsService.getRegistrations()
        }).pipe(
            map(({ mockData, teachers, registrations }) => {
                // Map teachers to the format expected by the template
                const teamMembers = teachers.map(teacher => ({
                    id: teacher.id,
                    avatar: teacher.avatar || null,
                    name: `${teacher.first_name} ${teacher.last_name}`,
                    email: teacher.email,
                    phone: teacher.phone || '',
                    title: teacher.academy_name || 'No Academy Assigned',
                    status: teacher.status || 'active'
                }));

                // Replace mock teamMembers with real teachers and add registrations
                return {
                    ...mockData,
                    teamMembers,
                    registrations: registrations || []
                };
            }),
            tap((response: any) => {
                this._data.next(response);
            })
        );
    }
}
