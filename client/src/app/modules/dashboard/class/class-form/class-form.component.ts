import {Component, OnInit} from "@angular/core";
import {Router, ActivatedRoute} from "@angular/router";
import {FormGroup, FormBuilder, FormArray} from "@angular/forms";
import {ToastrService} from "ngx-toastr";
import {map} from "rxjs/operators";
import {UnderscoreService} from '@app/@core/services/underscore.service';
import {ClassService} from "@app/@core/http/class.service";
import {Class} from "@app/@core/models/class";
import {Pass} from "@app/@core/models/pass";
import {Admin} from "@app/@core/models/admin";

@Component({
    selector: "class-form",
    templateUrl: "./class-form.component.html",
    styleUrls: ["./class-form.component.scss"],
    providers: [ToastrService]
})
export class ClassFormComponent implements OnInit {
    heading: string;
    type: string;
    classess: Class;
    passes = [];
    filterdPasses = [];

    items: FormArray;

    classForm: FormGroup;
    inProgress: boolean = false;

    constructor(
        private router: Router,
        private route: ActivatedRoute,
        private fb: FormBuilder,
        private classService: ClassService,
        private toastr: ToastrService,
        private underscore: UnderscoreService
    ) {
        this.type = this.route.snapshot.queryParamMap.get("action");

        if (this.type == "add") {
            this.heading = "L'ajout d'une class";
            this.classForm = this.createAddForm();
        } else {
            this.heading = "La modification d'une class";
            this.route.data
                .pipe(map(data => data.class))
                .subscribe((classes: Class) => {
                    this.classess = classes;
                    this.classForm = this.createEditForm(this.classess);
                });
        }
    }

    ngOnInit() {
        this.classService.getPass().subscribe();
        this.classService.passes.subscribe(passes => {
            this.filterdPasses = [];
            this.passes = passes;
            this.filterdPasses = passes;

            this.addItem(this.filterdPasses);
        });

    }

    onCancel(): void {
        this.router.navigate(["../"], {relativeTo: this.route});
    }

    onSubmit() {
        let formValues = this.removeEmpty(Object.assign({}, this.classForm.value));
        let formData: FormData = this.underscore.convertJsontoFormData(formValues);
        console.log({formValues});
        // console.log(this.classForm.controls.passes.controls.name.value);

        let photo: any = document.querySelector('#avatar ');

        let files = photo.files;

        let fileList: FileList = files;


        if (fileList.length > 0) {
            let file: File = fileList[0];
            formData.append('image', file, file.name);
        }

        this.inProgress = true;

        if (this.type == "add") {
            this.classService.add(formData).subscribe((response: any) => {
                if (response.class_id !== undefined) {
                    this.toastr.success(
                        `la class a été ajouter avec succès avec ID: ${response.class_id}`,
                        this.heading,
                        {timeOut: 5000}
                    );
                    // const arr = <FormArray>this.classForm.controls.passes;

                    // arr.clear();
                    // arr.removeAt(0);
                    // arr.push(new FormGroup({}));

                    this.router.navigate(["../"], {relativeTo: this.route});
                } else {
                    this.toastr.error(`${response.errors[0]}`, this.heading, {
                        closeButton: true
                    });
                }
            }, (error) => {
                console.error(error)
            }, () => {
                this.inProgress = false;
            });
        } else {
            this.classService.edit(formData, this.classess.id)
                .subscribe((response: any) => {
                    if (response.class_id !== undefined && response.class_id > 0) {
                        this.toastr.success(
                            `la class a modifié avec succès`,
                            this.heading,
                            {timeOut: 5000}
                        );
                        this.router.navigate(["../"], {relativeTo: this.route});
                    } else {
                        this.toastr.error(`${response.errors[0]}`, this.heading, {
                            closeButton: true
                        });
                    }
                }, (error) => {
                    console.error(error)
                }, () => {
                    this.inProgress = false;
                });
        }
    }

    createAddForm() {
        return this.fb.group({
            name: [null],
            // prix_min: [null],
            // prix_max: [null],
            avatar: [null],
            passes: this.fb.array([])
        });
    }

    createItem(pass: Pass): FormGroup {
        return this.fb.group({
            passid: [pass.id],
            prix_min: '',
            prix_max: ''
        });
    }

    addItem(passes: any): void {
        this.items = this.classForm.get('passes') as FormArray;
        // let arr =passid <FormArray>this.classForm.controls.passes;
        this.items.controls = [];
        this.items.removeAt(0);
        console.log(this.items);

        // this.items = [];
        for (var pas of passes) {
           this.items.push(this.createItem(pas));
        }
    }

    createEditForm(class1: Class) {
        return this.fb.group({
            name: [class1.name],
            image: [null],
        });
    }

    setAvatar(avatar: any) {
        try {
            this.classForm.patchValue({
                avatar
            });
        } catch (e) {
        }
    }

    removeEmpty(object) {
        Object.keys(object).forEach(key => {
            if (object[key] && typeof object[key] === "object")
                this.removeEmpty(object[key]);
            else if (
                object[key] == null ||
                object[key].toString().trim() == "" ||
                object[key] == undefined
            )
                delete object[key];
        });
        return object;
    }


}
