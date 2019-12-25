import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { FormGroup, FormBuilder } from "@angular/forms";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';
import {ClassService} from "@app/@core/http/class.service";
import {Class} from "@app/@core/models/class";

@Component({
  selector: "app-partner-form",
  templateUrl: "./class-form.component.html",
  styleUrls: ["./class-form.component.scss"],
  providers: [ToastrService]
})
export class ClassFormComponent implements OnInit {
  heading: string;
  type: string;
  classess: Class;
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

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.classForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    this.inProgress = true;

    if (this.type == "add") {
      this.classService.add(formData).subscribe((response: any) => {
        if (response.class_id !== undefined && response.partner_id > 0) {
          this.toastr.success(
              `la class a été ajouter avec succès avec ID: ${response.class_id}`,
              this.heading,
              { timeOut: 5000 }
          );
          this.router.navigate(["../"], { relativeTo: this.route });
        } else {
          this.toastr.error(`${response.errors[0]}`, this.heading, {
            closeButton: true
          });
        }
      }, (error) => { console.error(error)}, () => { this.inProgress = false; });
    } else {
      this.classService.edit(formData, this.classess.id)
          .subscribe((response: any) => {
            if (response.class_id !== undefined && response.class_id > 0) {
              this.toastr.success(
                  `la class a modifié avec succès`,
                  this.heading,
                  { timeOut: 5000 }
              );
              this.router.navigate(["../"], { relativeTo: this.route });
            } else {
              this.toastr.error(`${response.errors[0]}`, this.heading, {
                closeButton: true
              });
            }
          }, (error) => { console.error(error)}, () => { this.inProgress = false; });
    }
  }

  createAddForm() {
    return this.fb.group({
      name: [null],
      prix_min: [null],
      prix_max: [null],
      image: [null],
    });
  }

  createEditForm(class1: Class) {
    return this.fb.group({
      name: [class1.name],
      prix_min: [class1.prix_min],
      prix_max: [class1.prix_max],
      image: [null],
    });
  }

  setAvatar(avatar: any) {
    try {
      this.classForm.patchValue({
        avatar
      });
    } catch (e) {}
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
