import {
    ChangeDetectionStrategy,
    ChangeDetectorRef,
    Component,
    OnDestroy,
    OnInit,
    ViewEncapsulation,
} from '@angular/core';
import { FormArray, FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatChipsModule } from '@angular/material/chips';
import { MatIconModule } from '@angular/material/icon';
import { Router, ActivatedRoute } from '@angular/router';
import { AcademiesService } from 'app/core/services/academies.service';
import { Academy, AcademyFormData } from 'app/core/types/academies.types';
import { Subject, takeUntil } from 'rxjs';
import { CommonModule } from '@angular/common';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatCardModule } from '@angular/material/card';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';

@Component({
    selector: 'academy-form',
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
        MatChipsModule,
        MatIconModule,
        MatCardModule,
        MatSlideToggleModule,
        MatSnackBarModule,
    ],
})
export class AcademyFormComponent implements OnInit, OnDestroy {
    academyForm: FormGroup;
    academy: Academy | null = null;
    isEditMode: boolean = false;
    loading: boolean = false;
    saving: boolean = false;

    // Tags options
    tagOptions = ['Art', 'Cooking', 'Language', 'Music', 'Sports', 'Kids', 'Others'];

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _formBuilder: FormBuilder,
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _academiesService: AcademiesService,
        private _changeDetectorRef: ChangeDetectorRef,
        private _snackBar: MatSnackBar
    ) {
        this.academyForm = this.createForm();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        const id = this._activatedRoute.snapshot.paramMap.get('id');
        const mode = this._activatedRoute.snapshot.url[this._activatedRoute.snapshot.url.length - 1]?.path;

        if (id && mode === 'edit') {
            this.isEditMode = true;
            this.loadAcademy(id);
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
            title: ['', [Validators.required]],
            description: ['', [Validators.required]],
            price: [''],
            level: [''],
            age: [''],
            schedule: this._formBuilder.array([]),
            image: [''],
            tag: ['', [Validators.required]],
            catchPhrase: [''],
            goal: this._formBuilder.array([]),
            equipment: [''],
            academyDetailsImg: [''],
            linkName: ['', [Validators.required]],
            note: this._formBuilder.array([]),
            status: ['active'],
        });
    }

    /**
     * Get schedule FormArray
     */
    get scheduleArray(): FormArray {
        return this.academyForm.get('schedule') as FormArray;
    }

    /**
     * Get goal FormArray
     */
    get goalArray(): FormArray {
        return this.academyForm.get('goal') as FormArray;
    }

    /**
     * Get note FormArray
     */
    get noteArray(): FormArray {
        return this.academyForm.get('note') as FormArray;
    }

    /**
     * Load academy for editing
     */
    loadAcademy(id: string): void {
        this.loading = true;
        this._changeDetectorRef.markForCheck();

        this._academiesService
            .getById(id)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe({
                next: (academy) => {
                    this.academy = academy;
                    this.populateForm(academy);
                    this.loading = false;
                    this._changeDetectorRef.markForCheck();
                },
                error: (error) => {
                    console.error('Error loading academy:', error);
                    this._snackBar.open('Error loading academy', 'Close', {
                        duration: 3000,
                    });
                    this._router.navigate(['/apps/academy']);
                },
            });
    }

    /**
     * Populate form with academy data
     */
    populateForm(academy: Academy): void {
        // Clear arrays
        while (this.scheduleArray.length) this.scheduleArray.removeAt(0);
        while (this.goalArray.length) this.goalArray.removeAt(0);
        while (this.noteArray.length) this.noteArray.removeAt(0);

        // Populate arrays
        academy.schedule.forEach(item => {
            this.scheduleArray.push(this._formBuilder.control(item));
        });
        academy.goal.forEach(item => {
            this.goalArray.push(this._formBuilder.control(item));
        });
        academy.note.forEach(item => {
            this.noteArray.push(this._formBuilder.control(item));
        });

        // Populate other fields
        this.academyForm.patchValue({
            title: academy.title,
            description: academy.description,
            price: academy.price,
            level: academy.level,
            age: academy.age,
            image: academy.image,
            tag: academy.tag,
            catchPhrase: academy.catchPhrase,
            equipment: academy.equipment,
            academyDetailsImg: academy.academyDetailsImg,
            linkName: academy.linkName,
            status: academy.status || 'active',
        });
    }

    /**
     * Add schedule item
     */
    addScheduleItem(): void {
        this.scheduleArray.push(this._formBuilder.control(''));
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Remove schedule item
     */
    removeScheduleItem(index: number): void {
        this.scheduleArray.removeAt(index);
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Add goal item
     */
    addGoalItem(): void {
        this.goalArray.push(this._formBuilder.control(''));
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Remove goal item
     */
    removeGoalItem(index: number): void {
        this.goalArray.removeAt(index);
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Add note item
     */
    addNoteItem(): void {
        this.noteArray.push(this._formBuilder.control(''));
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Remove note item
     */
    removeNoteItem(index: number): void {
        this.noteArray.removeAt(index);
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Save academy
     */
    save(): void {
        if (this.academyForm.invalid) {
            this._snackBar.open('Please fill in all required fields', 'Close', {
                duration: 3000,
            });
            return;
        }

        this.saving = true;
        this._changeDetectorRef.markForCheck();

        const formData: AcademyFormData = {
            ...this.academyForm.value,
            schedule: this.scheduleArray.value,
            goal: this.goalArray.value,
            note: this.noteArray.value,
        };

        const operation = this.isEditMode
            ? this._academiesService.update(this.academy!.id!, formData)
            : this._academiesService.create(formData);

        operation.pipe(takeUntil(this._unsubscribeAll)).subscribe({
            next: () => {
                this._snackBar.open(
                    `Academy ${this.isEditMode ? 'updated' : 'created'} successfully`,
                    'Close',
                    { duration: 3000 }
                );
                this._router.navigate(['/apps/academy']);
            },
            error: (error) => {
                console.error('Error saving academy:', error);
                this._snackBar.open('Error saving academy', 'Close', {
                    duration: 3000,
                });
                this.saving = false;
                this._changeDetectorRef.markForCheck();
            },
        });
    }

    /**
     * Cancel
     */
    cancel(): void {
        this._router.navigate(['/apps/academy']);
    }
}

