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
import { AcademiesService } from 'app/core/services/academies.service';
import { Academy } from 'app/core/types/academies.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatChipsModule } from '@angular/material/chips';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSelectModule } from '@angular/material/select';
import { MatSlideToggleModule, MatSlideToggleChange } from '@angular/material/slide-toggle';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'academy-list',
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
        MatChipsModule,
        MatDialogModule,
        MatSnackBarModule,
        MatTooltipModule,
        MatSelectModule,
        MatSlideToggleModule,
        RouterLink,
    ],
})
export class AcademyListComponent implements OnInit, OnDestroy {
    academies: Academy[] = [];
    filteredAcademies: Academy[] = [];
    searchQuery: string = '';
    selectedCategory: string = 'all';
    categories: string[] = [];
    loading: boolean = false;

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _router: Router,
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
     * Load academies
     */
    loadAcademies(): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._academiesService
            .getAll(true) // Include inactive for admin
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (academies) => {
                    this.academies = academies;
                    // Extract unique categories
                    const uniqueCategories = new Set(
                        academies
                            .map(a => a.tag)
                            .filter(tag => tag && tag.trim() !== '')
                    );
                    this.categories = Array.from(uniqueCategories).sort();
                    this.applyFilters();
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading academies:', error);
                    this._snackBar.open('Error loading academies', 'Close', {
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
     * Filter by category
     */
    filterByCategory(category: string): void {
        this.selectedCategory = category;
        this.applyFilters();
    }

    /**
     * Apply all filters (search and category)
     */
    applyFilters(): void {
        let filtered = [...this.academies];

        // Filter by category
        if (this.selectedCategory && this.selectedCategory !== 'all') {
            filtered = filtered.filter(
                (academy) => academy.tag === this.selectedCategory
            );
        }

        // Filter by search query
        if (this.searchQuery) {
            const lowerQuery = this.searchQuery.toLowerCase();
            filtered = filtered.filter(
                (academy) =>
                    academy.title.toLowerCase().includes(lowerQuery) ||
                    academy.description.toLowerCase().includes(lowerQuery) ||
                    (academy.tag && academy.tag.toLowerCase().includes(lowerQuery))
            );
        }

        this.filteredAcademies = filtered;
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Navigate to create new academy
     */
    createAcademy(): void {
        this._router.navigate(['/apps/academy/new']);
    }

    /**
     * Navigate to edit academy
     */
    editAcademy(academy: Academy): void {
        this._router.navigate(['/apps/academy', academy.id, 'edit']);
    }

    /**
     * Delete academy (soft delete)
     */
    deleteAcademy(academy: Academy): void {
        if (!confirm(`Are you sure you want to delete "${academy.title}"?`)) {
            return;
        }

        this._academiesService
            .delete(academy.id!)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: () => {
                    this._snackBar.open('Academy deleted successfully', 'Close', {
                        duration: 3000,
                    });
                    this.loadAcademies();
                },
                error: (error) => {
                    console.error('Error deleting academy:', error);
                    this._snackBar.open('Error deleting academy', 'Close', {
                        duration: 3000,
                    });
                },
            });
    }

    /**
     * Handle toggle change event
     */
    onToggleChange(event: MatSlideToggleChange, academy: Academy): void {
        const newStatus = event.checked ? 'active' : 'inactive';
        this.toggleStatus(academy, newStatus);
    }

    /**
     * Toggle academy status
     */
    toggleStatus(academy: Academy, newStatus?: 'active' | 'inactive'): void {
        const status: 'active' | 'inactive' = newStatus || (academy.status === 'active' ? 'inactive' : 'active');
        
        // Optimistically update the local state
        const academyIndex = this.academies.findIndex(a => a.id === academy.id);
        if (academyIndex !== -1) {
            this.academies[academyIndex].status = status;
        }
        this.applyFilters();
        this._changeDetectorRef.markForCheck();
        
        this._academiesService
            .update(academy.id!, { status })
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (updatedAcademy) => {
                    // Update with server response
                    const index = this.academies.findIndex(a => a.id === academy.id);
                    if (index !== -1) {
                        this.academies[index] = updatedAcademy;
                        this.applyFilters();
                        this._changeDetectorRef.markForCheck();
                    }
                    this._snackBar.open(
                        `Academy ${status === 'active' ? 'activated' : 'deactivated'}`,
                        'Close',
                        { duration: 3000 }
                    );
                },
                error: (error) => {
                    console.error('Error updating academy status:', error);
                    // Revert optimistic update on error
                    const index = this.academies.findIndex(a => a.id === academy.id);
                    if (index !== -1) {
                        this.academies[index].status = academy.status; // Revert to original
                        this.applyFilters();
                        this._changeDetectorRef.markForCheck();
                    }
                    this._snackBar.open('Error updating academy', 'Close', {
                        duration: 3000,
                    });
                },
            });
    }

    /**
     * Get tag color classes based on tag value
     */
    getTagColorClasses(tag: string): string {
        const tagLower = tag.toLowerCase();
        if (tagLower.includes('art')) {
            return 'bg-pink-100 text-pink-800 dark:bg-pink-500 dark:text-pink-50';
        } else if (tagLower.includes('cooking')) {
            return 'bg-orange-100 text-orange-800 dark:bg-orange-500 dark:text-orange-50';
        } else if (tagLower.includes('language')) {
            return 'bg-blue-100 text-blue-800 dark:bg-blue-500 dark:text-blue-50';
        } else if (tagLower.includes('music')) {
            return 'bg-purple-100 text-purple-800 dark:bg-purple-500 dark:text-purple-50';
        } else if (tagLower.includes('sports')) {
            return 'bg-green-100 text-green-800 dark:bg-green-500 dark:text-green-50';
        } else if (tagLower.includes('kids')) {
            return 'bg-yellow-100 text-yellow-800 dark:bg-yellow-500 dark:text-yellow-50';
        } else {
            return 'bg-gray-100 text-gray-800 dark:bg-gray-500 dark:text-gray-50';
        }
    }

    /**
     * Track by function for ngFor loops
     */
    trackByFn(index: number, item: Academy): any {
        return item.id || index;
    }
}
