

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Base64ToPng } from "@app/@core/models/base64ToPng";
import { FormGroup, FormBuilder } from "@angular/forms";
import { Base64ToPngService } from "@app/@core/http/base64ToPng.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-base64ToPng-form",
  templateUrl: "./base64ToPng-form.component.html",
  styleUrls: ["./base64ToPng-form.component.scss"],
  providers: [ToastrService]
})
export class Base64ToPngFormComponent implements OnInit {
  heading: string;
  type: string;
  base64ToPng: Base64ToPng;
  base64ToPngForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private base64ToPngService: Base64ToPngService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du base64ToPng";
      this.base64ToPngForm = this.createAddForm();
    } else {
      this.heading = "La modification du base64ToPng";
      this.route.data
        .pipe(map(data => data.base64ToPng))
        .subscribe((base64ToPng: Base64ToPng) => {
          this.base64ToPng = base64ToPng;
          console.log(this.base64ToPng);
          this.base64ToPngForm = this.createEditForm(this.base64ToPng);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.base64ToPngForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.base64ToPngService.add(formData).subscribe((response: any) => {
        if (response.base64ToPng_id !== undefined && response.base64ToPng_id > 0) {
          this.toastr.success(
              `le base64ToPng a été ajouter avec succès avec ID: ${response.base64ToPng_id}`,
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
      this.base64ToPngService.edit(formData, this.base64ToPng.id)
          .subscribe((response: any) => {
            if (response.base64ToPng_id !== undefined && response.base64ToPng_id > 0) {
              this.toastr.success(
                  `le base64ToPng a été modifier avec succès`,
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
    return this.base64ToPngForm = this.fb.group({

     name: [null], 
     code: [null], 
    });
  }

  createEditForm(base64ToPng: Base64ToPng) {
    return this.base64ToPngForm = this.fb.group({

     name: [base64ToPng.name], 
     code: [base64ToPng.code], 
    });
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


 