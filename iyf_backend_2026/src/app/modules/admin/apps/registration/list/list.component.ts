import {
    ChangeDetectionStrategy,
    ChangeDetectorRef,
    Component,
    OnDestroy,
    OnInit,
    ViewEncapsulation,
    AfterViewInit,
    ViewChild,
} from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { Router, RouterLink } from '@angular/router';
import { RegistrationsService } from 'app/core/services/registrations.service';
import { AcademiesService } from 'app/core/services/academies.service';
import { Registration } from 'app/core/types/registrations.types';
import { Academy } from 'app/core/types/academies.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule, DatePipe } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatTableModule, MatTableDataSource } from '@angular/material/table';
import { MatPaginatorModule, MatPaginator } from '@angular/material/paginator';
import { FormsModule } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
import { MatChipsModule } from '@angular/material/chips';

@Component({
    selector: 'registration-list',
    templateUrl: './list.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    imports: [
        CommonModule,
        FormsModule,
        MatButtonModule,
        MatIconModule,
        MatInputModule,
        MatFormFieldModule,
        MatCardModule,
        MatDialogModule,
        MatSnackBarModule,
        MatTooltipModule,
        MatTableModule,
        MatPaginatorModule,
        MatSelectModule,
        MatChipsModule,
        RouterLink,
        DatePipe,
    ],
})
export class RegistrationListComponent implements OnInit, AfterViewInit, OnDestroy {
    registrations: Registration[] = [];
    filteredRegistrations: Registration[] = [];
    dataSource = new MatTableDataSource<Registration>([]);
    academies: Academy[] = [];
    searchQuery: string = '';
    selectedPeriod: string = 'all';
    selectedAcademy: string = 'all';
    selectedGender: string = 'all';
    loading: boolean = false;

    displayedColumns: string[] = [
        'number',
        'name',
        'email',
        'phone',
        'firstPeriod',
        'secondPeriod',
        'age',
        'gender',
        'createdAt',
        'actions',
    ];

    @ViewChild(MatPaginator) paginator!: MatPaginator;

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _router: Router,
        private _registrationsService: RegistrationsService,
        private _academiesService: AcademiesService,
        private _dialog: MatDialog,
        private _snackBar: MatSnackBar
    ) {}

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        this.loadAcademies();
        this.loadRegistrations();
    }

    /**
     * After view init
     */
    ngAfterViewInit(): void {
        if (this.paginator) {
            this.dataSource.paginator = this.paginator;
        }
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Load academies for filter
     */
    loadAcademies(): void {
        this._academiesService
            .getAll(true)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (academies) => {
                    this.academies = academies;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading academies:', error);
                },
            });
    }

    /**
     * Load registrations
     */
    loadRegistrations(): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._registrationsService
            .getRegistrations()
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (registrations) => {
                    this.registrations = registrations;
                    this.applyFilters();
                    this.setupDataSource();
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading registrations:', error);
                    this._snackBar.open(
                        'Error loading registrations',
                        'Close',
                        { duration: 3000 }
                    );
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
            });
    }

    /**
     * Filter by search query
     */
    filterByQuery(): void {
        this.applyFilters();
    }

    /**
     * Filter by period
     */
    filterByPeriod(): void {
        this.applyFilters();
    }

    /**
     * Filter by academy
     */
    filterByAcademy(): void {
        this.applyFilters();
    }

    /**
     * Filter by gender
     */
    filterByGender(): void {
        this.applyFilters();
    }

    /**
     * Apply all filters
     */
    applyFilters(): void {
        let filtered = [...this.registrations];

        // Filter by search query
        if (this.searchQuery.trim()) {
            const query = this.searchQuery.toLowerCase().trim();
            filtered = filtered.filter(
                (reg) =>
                    reg.firstName?.toLowerCase().includes(query) ||
                    reg.lastName?.toLowerCase().includes(query) ||
                    reg.email?.toLowerCase().includes(query) ||
                    reg.cellNumber?.toLowerCase().includes(query) ||
                    reg.firstPeriod?.academy?.toLowerCase().includes(query) ||
                    reg.secondPeriod?.academy?.toLowerCase().includes(query)
            );
        }

        // Filter by period
        if (this.selectedPeriod !== 'all') {
            if (this.selectedPeriod === 'first') {
                filtered = filtered.filter(
                    (reg) =>
                        reg.firstPeriod?.academy &&
                        reg.firstPeriod.academy !== 'N/A'
                );
            } else if (this.selectedPeriod === 'second') {
                filtered = filtered.filter(
                    (reg) =>
                        reg.secondPeriod?.academy &&
                        reg.secondPeriod.academy !== 'N/A'
                );
            }
        }

        // Filter by academy
        if (this.selectedAcademy !== 'all') {
            filtered = filtered.filter(
                (reg) =>
                    reg.firstPeriod?.academy === this.selectedAcademy ||
                    reg.secondPeriod?.academy === this.selectedAcademy
            );
        }

        // Filter by gender
        if (this.selectedGender !== 'all') {
            filtered = filtered.filter(
                (reg) => reg.gender?.toLowerCase() === this.selectedGender.toLowerCase()
            );
        }

        this.filteredRegistrations = filtered;
        this.setupDataSource();
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Setup data source with paginator
     */
    setupDataSource(): void {
        this.dataSource.data = this.filteredRegistrations;
        if (this.paginator) {
            this.dataSource.paginator = this.paginator;
        }
    }

    /**
     * Get registration number (global, not filtered)
     * This number is based on the original array position, not the filtered results
     */
    getRegistrationNumber(registration: Registration): number {
        if (!registration.id) return 0;
        const index = this.registrations.findIndex((r) => r.id === registration.id);
        return index >= 0 ? index + 1 : 0;
    }

    /**
     * Export to CSV
     */
    exportToCSV(): void {
        const headers = ['#', 'First Name', 'Last Name', 'Email', 'Phone', 'First Period', 'Second Period', 'Age', 'Gender', 'City', 'State', 'Registered'];
        const rows = this.filteredRegistrations.map(reg => [
            this.getRegistrationNumber(reg),
            reg.firstName || '',
            reg.lastName || '',
            reg.email || '',
            reg.cellNumber || '',
            this.getPeriodDisplay(reg.firstPeriod),
            this.getPeriodDisplay(reg.secondPeriod),
            reg.age || '',
            reg.gender || '',
            reg.city || '',
            reg.state || '',
            reg.createdAt ? new Date(reg.createdAt).toLocaleString() : ''
        ]);

        const csvContent = [
            headers.join(','),
            ...rows.map(row => row.map(cell => `"${cell}"`).join(','))
        ].join('\n');

        const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        const url = URL.createObjectURL(blob);
        link.setAttribute('href', url);
        link.setAttribute('download', `registrations_${new Date().toISOString().split('T')[0]}.csv`);
        link.style.visibility = 'hidden';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    /**
     * Create new registration
     */
    createRegistration(): void {
        this._router.navigate(['/apps/registration/new']);
    }

    /**
     * Edit registration
     */
    editRegistration(registration: Registration): void {
        if (registration.id) {
            this._router.navigate(['/apps/registration', registration.id, 'edit']);
        }
    }

    /**
     * Delete registration
     */
    deleteRegistration(registration: Registration): void {
        if (
            !confirm(
                `Are you sure you want to delete the registration for ${registration.firstName} ${registration.lastName}?`
            )
        ) {
            return;
        }

        if (!registration.id) {
            return;
        }

        this._registrationsService
            .deleteRegistration(registration.id)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: () => {
                    this._snackBar.open(
                        'Registration deleted successfully',
                        'Close',
                        { duration: 3000 }
                    );
                    this.loadRegistrations();
                },
                error: (error) => {
                    console.error('Error deleting registration:', error);
                    this._snackBar.open(
                        'Error deleting registration',
                        'Close',
                        { duration: 3000 }
                    );
                },
            });
    }

    /**
     * Get full name
     */
    getFullName(registration: Registration): string {
        return `${registration.firstName || ''} ${registration.lastName || ''}`.trim() || 'N/A';
    }

    /**
     * Get period display
     */
    getPeriodDisplay(period: any): string {
        if (!period || !period.academy || period.academy === 'N/A') {
            return 'N/A';
        }
        let display = period.academy;
        if (period.level && period.level !== 'N/A') {
            display += ` (${period.level})`;
        }
        return display;
    }
}
