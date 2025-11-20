import {
    ChangeDetectionStrategy,
    ChangeDetectorRef,
    Component,
    OnDestroy,
    OnInit,
    ViewEncapsulation,
} from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { Router, RouterLink } from '@angular/router';
import { TeachersService } from 'app/core/services/teachers.service';
import { Teacher } from 'app/core/types/teachers.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSlideToggleModule, MatSlideToggleChange } from '@angular/material/slide-toggle';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule } from '@angular/forms';
import { AcademiesService } from 'app/core/services/academies.service';
import { Academy } from 'app/core/types/academies.types';

@Component({
    selector: 'teachers-list',
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
        MatSlideToggleModule,
        MatSelectModule,
        RouterLink,
    ],
})
export class TeachersListComponent implements OnInit, OnDestroy {
    teachers: Teacher[] = [];
    filteredTeachers: Teacher[] = [];
    searchQuery: string = '';
    selectedAcademy: string = 'all';
    academies: Academy[] = [];
    loading: boolean = false;

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _router: Router,
        private _teachersService: TeachersService,
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
        this.loadTeachers();
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
     * Load teachers
     */
    loadTeachers(): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._teachersService
            .getAll(true) // Include inactive for admin
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (teachers) => {
                    this.teachers = teachers;
                    this.applyFilters();
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading teachers:', error);
                    this._snackBar.open('Error loading teachers', 'Close', {
                        duration: 3000,
                    });
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
            });
    }

    /**
     * Filter by search query
     */
    filterByQuery(query: string): void {
        this.searchQuery = query;
        this.applyFilters();
    }

    /**
     * Filter by academy
     */
    filterByAcademy(academyId: string): void {
        this.selectedAcademy = academyId;
        this.applyFilters();
    }

    /**
     * Apply all filters (search and academy)
     */
    applyFilters(): void {
        let filtered = [...this.teachers];

        // Filter by academy
        if (this.selectedAcademy && this.selectedAcademy !== 'all') {
            filtered = filtered.filter(
                (teacher) => teacher.academy_id === this.selectedAcademy
            );
        }

        // Filter by search query
        if (this.searchQuery) {
            const lowerQuery = this.searchQuery.toLowerCase();
            filtered = filtered.filter(
                (teacher) =>
                    teacher.first_name.toLowerCase().includes(lowerQuery) ||
                    teacher.last_name.toLowerCase().includes(lowerQuery) ||
                    teacher.email.toLowerCase().includes(lowerQuery) ||
                    (teacher.academy_name && teacher.academy_name.toLowerCase().includes(lowerQuery))
            );
        }

        this.filteredTeachers = filtered;
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Navigate to create new teacher
     */
    createTeacher(): void {
        this._router.navigate(['/apps/teachers/new']);
    }

    /**
     * Navigate to edit teacher
     */
    editTeacher(teacher: Teacher): void {
        this._router.navigate(['/apps/teachers', teacher.id, 'edit']);
    }

    /**
     * Delete teacher
     */
    deleteTeacher(teacher: Teacher): void {
        if (!confirm(`Are you sure you want to delete "${teacher.first_name} ${teacher.last_name}"?`)) {
            return;
        }

        this._teachersService
            .delete(teacher.id!)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: () => {
                    this._snackBar.open('Teacher deleted successfully', 'Close', {
                        duration: 3000,
                    });
                    this.loadTeachers();
                },
                error: (error) => {
                    console.error('Error deleting teacher:', error);
                    this._snackBar.open('Error deleting teacher', 'Close', {
                        duration: 3000,
                    });
                },
            });
    }

    /**
     * Handle toggle change event
     */
    onToggleChange(event: MatSlideToggleChange, teacher: Teacher): void {
        const newStatus = event.checked ? 'active' : 'inactive';
        this.toggleStatus(teacher, newStatus);
    }

    /**
     * Toggle teacher status
     */
    toggleStatus(teacher: Teacher, newStatus?: 'active' | 'inactive'): void {
        const status: 'active' | 'inactive' = newStatus || (teacher.status === 'active' ? 'inactive' : 'active');
        
        // Optimistically update the local state
        const teacherIndex = this.teachers.findIndex(t => t.id === teacher.id);
        if (teacherIndex !== -1) {
            this.teachers[teacherIndex].status = status;
        }
        this.applyFilters();
        this._changeDetectorRef.markForCheck();
        
        this._teachersService
            .toggleStatus(teacher.id!, status)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (updatedTeacher) => {
                    // Update with server response
                    const index = this.teachers.findIndex(t => t.id === teacher.id);
                    if (index !== -1) {
                        this.teachers[index] = updatedTeacher;
                        this.applyFilters();
                        this._changeDetectorRef.markForCheck();
                    }
                    this._snackBar.open(
                        `Teacher ${status === 'active' ? 'activated' : 'deactivated'}`,
                        'Close',
                        { duration: 3000 }
                    );
                },
                error: (error) => {
                    console.error('Error updating teacher status:', error);
                    // Revert optimistic update on error
                    const index = this.teachers.findIndex(t => t.id === teacher.id);
                    if (index !== -1) {
                        this.teachers[index].status = teacher.status; // Revert to original
                        this.applyFilters();
                        this._changeDetectorRef.markForCheck();
                    }
                    this._snackBar.open('Error updating teacher', 'Close', {
                        duration: 3000,
                    });
                },
            });
    }

    /**
     * Get full name
     */
    getFullName(teacher: Teacher): string {
        return `${teacher.first_name} ${teacher.last_name}`;
    }

    /**
     * Get initials from teacher name
     */
    getInitials(teacher: Teacher): string {
        const firstInitial = teacher.first_name?.charAt(0).toUpperCase() || '';
        // Get first letter of last name (handle compound last names)
        const lastParts = teacher.last_name?.split(' ') || [];
        const lastInitial = lastParts.length > 0 ? lastParts[lastParts.length - 1].charAt(0).toUpperCase() : '';
        return `${firstInitial}${lastInitial}`;
    }

    /**
     * Track by function for ngFor loops
     */
    trackByFn(index: number, item: Teacher): any {
        return item.id || index;
    }
}

