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
import { RegistrationsService } from 'app/core/services/registrations.service';
import { AcademiesService } from 'app/core/services/academies.service';
import { Registration } from 'app/core/types/registrations.types';
import { Academy } from 'app/core/types/academies.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule } from '@angular/common';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatCardModule } from '@angular/material/card';

@Component({
    selector: 'registration-form',
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
        MatSnackBarModule,
    ],
})
export class RegistrationFormComponent implements OnInit, OnDestroy {
    registrationForm: FormGroup;
    registration: Registration | null = null;
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
        private _registrationsService: RegistrationsService,
        private _academiesService: AcademiesService,
        private _changeDetectorRef: ChangeDetectorRef,
        private _snackBar: MatSnackBar
    ) {
        this.registrationForm = this.createForm();
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
            this.loadRegistration(id);
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
            firstName: ['', [Validators.required]],
            lastName: ['', [Validators.required]],
            email: ['', [Validators.required, Validators.email]],
            confirmEmail: ['', [Validators.required, Validators.email]],
            cellNumber: [''],
            address: [''],
            city: [''],
            state: [''],
            zipCode: [''],
            birthday: [''],
            age: [''],
            gender: [''],
            firstPeriodAcademy: [''],
            firstPeriodLevel: [''],
            secondPeriodAcademy: [''],
            secondPeriodLevel: [''],
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
     * Load registration data
     */
    loadRegistration(id: string): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._registrationsService
            .getRegistrationById(id)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (registration) => {
                    if (registration) {
                        this.registration = registration;
                        this.populateForm(registration);
                    }
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading registration:', error);
                    this._snackBar.open('Error loading registration', 'Close', { duration: 3000 });
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
            });
    }

    /**
     * Populate form with registration data
     */
    populateForm(registration: Registration): void {
        this.registrationForm.patchValue({
            firstName: registration.firstName || '',
            lastName: registration.lastName || '',
            email: registration.email || '',
            confirmEmail: registration.confirmEmail || '',
            cellNumber: registration.cellNumber || '',
            address: registration.address || '',
            city: registration.city || '',
            state: registration.state || '',
            zipCode: registration.zipCode || '',
            birthday: registration.birthday || '',
            age: registration.age || '',
            gender: registration.gender || '',
            firstPeriodAcademy: registration.firstPeriod?.academy || '',
            firstPeriodLevel: registration.firstPeriod?.level || '',
            secondPeriodAcademy: registration.secondPeriod?.academy || '',
            secondPeriodLevel: registration.secondPeriod?.level || '',
        });
    }

    /**
     * Save registration
     */
    save(): void {
        if (this.registrationForm.invalid) {
            this.registrationForm.markAllAsTouched();
            return;
        }

        this.saving = true;
        this._changeDetectorRef.markForCheck();

        const formValue = this.registrationForm.value;
        const registrationData: Omit<Registration, 'id' | 'createdAt' | 'updatedAt'> = {
            firstName: formValue.firstName,
            lastName: formValue.lastName,
            email: formValue.email,
            confirmEmail: formValue.confirmEmail,
            cellNumber: formValue.cellNumber,
            address: formValue.address,
            city: formValue.city,
            state: formValue.state,
            zipCode: formValue.zipCode,
            birthday: formValue.birthday,
            age: formValue.age,
            gender: formValue.gender,
            firstPeriod: {
                academy: formValue.firstPeriodAcademy || undefined,
                level: formValue.firstPeriodLevel || undefined,
            },
            secondPeriod: {
                academy: formValue.secondPeriodAcademy || undefined,
                level: formValue.secondPeriodLevel || undefined,
            },
        };

        if (this.isEditMode && this.registration?.id) {
            // Update
            this._registrationsService
                .updateRegistration(this.registration.id, registrationData)
                .pipe(takeUntil(this._unsubscribeAll))
                .subscribe({
                    next: (success) => {
                        if (success) {
                            this._snackBar.open('Registration updated successfully', 'Close', { duration: 3000 });
                            this._router.navigate(['/apps/registration']);
                        }
                    },
                    error: (error) => {
                        console.error('Error updating registration:', error);
                        this._snackBar.open('Error updating registration', 'Close', { duration: 3000 });
                        this.saving = false;
                        this._changeDetectorRef.markForCheck();
                    },
                });
        } else {
            // Create
            this._registrationsService
                .createRegistration(registrationData)
                .pipe(takeUntil(this._unsubscribeAll))
                .subscribe({
                    next: () => {
                        this._snackBar.open('Registration created successfully', 'Close', { duration: 3000 });
                        this._router.navigate(['/apps/registration']);
                    },
                    error: (error) => {
                        console.error('Error creating registration:', error);
                        this._snackBar.open('Error creating registration', 'Close', { duration: 3000 });
                        this.saving = false;
                        this._changeDetectorRef.markForCheck();
                    },
                });
        }
    }

    /**
     * Cancel
     */
    cancel(): void {
        this._router.navigate(['/apps/registration']);
    }
}

