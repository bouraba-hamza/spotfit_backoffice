

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Activitie } from "@app/@core/models/activitie";
import { FormGroup, FormBuilder } from "@angular/forms";
import { ActivitieService } from "@app/@core/http/activitie.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-activitie-form",
  templateUrl: "./activitie-form.component.html",
  styleUrls: ["./activitie-form.component.scss"],
  providers: [ToastrService]
})
export class ActivitieFormComponent implements OnInit {
  heading: string;
  type: string;
  activitie: Activitie;
  activitieForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private activitieService: ActivitieService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du activitie";
      this.activitieForm = this.createAddForm();
    } else {
      this.heading = "La modification du activitie";
      this.route.data
        .pipe(map(data => data.activitie))
        .subscribe((activitie: Activitie) => {
          this.activitie = activitie;
          console.log(this.activitie);
          this.activitieForm = this.createEditForm(this.activitie);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.activitieForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.activitieService.add(formData).subscribe((response: any) => {
        if (response.activitie_id !== undefined && response.activitie_id > 0) {
          this.toastr.success(
              `le activitie a été ajouter avec succès avec ID: ${response.activitie_id}`,
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
      this.activitieService.edit(formData, this.activitie.id)
          .subscribe((response: any) => {
            if (response.activitie_id !== undefined && response.activitie_id > 0) {
              this.toastr.success(
                  `le activitie a été modifier avec succès`,
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
    return this.activitieForm = this.fb.group({

     name: [null], 
     icon: [null], 
    });
  }

  createEditForm(activitie: Activitie) {
    return this.activitieForm = this.fb.group({

     name: [activitie.name], 
     icon: [activitie.icon], 
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


 