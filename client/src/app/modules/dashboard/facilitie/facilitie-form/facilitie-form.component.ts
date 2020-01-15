

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Facilitie } from "@app/@core/models/facilitie";
import { FormGroup, FormBuilder } from "@angular/forms";
import { FacilitieService } from "@app/@core/http/facilitie.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-facilitie-form",
  templateUrl: "./facilitie-form.component.html",
  styleUrls: ["./facilitie-form.component.scss"],
  providers: [ToastrService]
})
export class FacilitieFormComponent implements OnInit {
  heading: string;
  type: string;
  facilitie: Facilitie;
  facilitieForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private facilitieService: FacilitieService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du facilitie";
      this.facilitieForm = this.createAddForm();
    } else {
      this.heading = "La modification du facilitie";
      this.route.data
        .pipe(map(data => data.facilitie))
        .subscribe((facilitie: Facilitie) => {
          this.facilitie = facilitie;
          console.log(this.facilitie);
          this.facilitieForm = this.createEditForm(this.facilitie);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.facilitieForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.facilitieService.add(formData).subscribe((response: any) => {
        if (response.facilitie_id !== undefined && response.facilitie_id > 0) {
          this.toastr.success(
              `le facilitie a été ajouter avec succès avec ID: ${response.facilitie_id}`,
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
      this.facilitieService.edit(formData, this.facilitie.id)
          .subscribe((response: any) => {
            if (response.facilitie_id !== undefined && response.facilitie_id > 0) {
              this.toastr.success(
                  `le facilitie a été modifier avec succès`,
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
    return this.facilitieForm = this.fb.group({

     icon: [null], 
     name: [null], 
     order: [null], 
    });
  }

  createEditForm(facilitie: Facilitie) {
    return this.facilitieForm = this.fb.group({

     icon: [facilitie.icon], 
     name: [facilitie.name], 
     order: [facilitie.order], 
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


 