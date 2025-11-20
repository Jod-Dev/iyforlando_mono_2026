import {
    ChangeDetectionStrategy,
    ChangeDetectorRef,
    Component,
    OnDestroy,
    OnInit,
    ViewEncapsulation,
} from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { Router, ActivatedRoute } from '@angular/router';
import { TeachersService } from 'app/core/services/teachers.service';
import { AcademiesService } from 'app/core/services/academies.service';
import { Teacher, TeacherFormData } from 'app/core/types/teachers.types';
import { Academy } from 'app/core/types/academies.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule } from '@angular/common';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatCardModule } from '@angular/material/card';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';

@Component({
    selector: 'teacher-form',
    templateUrl: './form.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    imports: [
        CommonModule,
        ReactiveFormsModule,
        MatButtonModule,
        MatFormFieldModule,
        MatInputModule,
        MatSelectModule,
        MatIconModule,
        MatCardModule,
        MatSlideToggleModule,
        MatSnackBarModule,
    ],
})
export class TeacherFormComponent implements OnInit, OnDestroy {
    teacherForm: FormGroup;
    teacher: Teacher | null = null;
    academies: Academy[] = [];
    isEditMode: boolean = false;
    loading: boolean = false;
    saving: boolean = false;

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _formBuilder: FormBuilder,
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _teachersService: TeachersService,
        private _academiesService: AcademiesService,
        private _changeDetectorRef: ChangeDetectorRef,
        private _snackBar: MatSnackBar
    ) {
        this.teacherForm = this.createForm();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        this.loadAcademies();
        
        const id = this._activatedRoute.snapshot.paramMap.get('id');
        const mode = this._activatedRoute.snapshot.url[this._activatedRoute.snapshot.url.length - 1]?.path;

        if (id && mode === 'edit') {
            this.isEditMode = true;
            this.loadTeacher(id);
        } else if (mode === 'new') {
            this.isEditMode = false;
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
     * Create form
     */
    createForm(): FormGroup {
        return this._formBuilder.group({
            first_name: ['', [Validators.required]],
            last_name: ['', [Validators.required]],
            email: ['', [Validators.required, Validators.email]],
            phone: [''],
            avatar: [''],
            academy_id: [''],
            academy_name: [''],
            bio: [''],
            status: ['active'],
        });
    }

    /**
     * Load academies for dropdown
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
     * Load teacher data
     */
    loadTeacher(id: string): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._teachersService
            .getById(id)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (teacher) => {
                    this.teacher = teacher;
                    this.populateForm(teacher);
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading teacher:', error);
                    this._snackBar.open('Error loading teacher', 'Close', {
                        duration: 3000,
                    });
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
            });
    }

    /**
     * Populate form with teacher data
     */
    populateForm(teacher: Teacher): void {
        this.teacherForm.patchValue({
            first_name: teacher.first_name || '',
            last_name: teacher.last_name || '',
            email: teacher.email || '',
            phone: teacher.phone || '',
            avatar: teacher.avatar || '',
            academy_id: teacher.academy_id || '',
            academy_name: teacher.academy_name || '',
            bio: teacher.bio || '',
            status: teacher.status || 'active',
        });
    }

    /**
     * Handle academy selection change
     */
    onAcademyChange(academyId: string): void {
        const selectedAcademy = this.academies.find(a => a.id === academyId);
        if (selectedAcademy) {
            this.teacherForm.patchValue({
                academy_name: selectedAcademy.title,
            });
        }
    }

    /**
     * Save teacher
     */
    save(): void {
        if (this.teacherForm.invalid) {
            this._snackBar.open('Please fill in all required fields', 'Close', {
                duration: 3000,
            });
            return;
        }

        this.saving = true;
        this._changeDetectorRef.markForCheck();

        const formData: TeacherFormData = this.teacherForm.value;

        if (this.isEditMode && this.teacher?.id) {
            // Update existing teacher
            this._teachersService
                .update(this.teacher.id, formData)
                .pipe(takeUntil(this._unsubscribeAll))
                .subscribe({
                    next: () => {
                        this._snackBar.open('Teacher updated successfully', 'Close', {
                            duration: 3000,
                        });
                        this._router.navigate(['/apps/teachers']);
                    },
                    error: (error) => {
                        console.error('Error updating teacher:', error);
                        this._snackBar.open('Error updating teacher', 'Close', {
                            duration: 3000,
                        });
                        this.saving = false;
                        this._changeDetectorRef.markForCheck();
                    },
                });
        } else {
            // Create new teacher
            this._teachersService
                .create(formData)
                .pipe(takeUntil(this._unsubscribeAll))
                .subscribe({
                    next: () => {
                        this._snackBar.open('Teacher created successfully', 'Close', {
                            duration: 3000,
                        });
                        this._router.navigate(['/apps/teachers']);
                    },
                    error: (error) => {
                        console.error('Error creating teacher:', error);
                        this._snackBar.open('Error creating teacher', 'Close', {
                            duration: 3000,
                        });
                        this.saving = false;
                        this._changeDetectorRef.markForCheck();
                    },
                });
        }
    }

    /**
     * Cancel and go back
     */
    cancel(): void {
        this._router.navigate(['/apps/teachers']);
    }
}

