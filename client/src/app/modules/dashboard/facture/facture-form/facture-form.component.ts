

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Facture } from "@app/@core/models/facture";
import { FormGroup, FormBuilder } from "@angular/forms";
import { FactureService } from "@app/@core/http/facture.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-facture-form",
  templateUrl: "./facture-form.component.html",
  styleUrls: ["./facture-form.component.scss"],
  providers: [ToastrService]
})
export class FactureFormComponent implements OnInit {
  heading: string;
  type: string;
  facture: Facture;
  factureForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private factureService: FactureService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du facture";
      this.factureForm = this.createAddForm();
    } else {
      this.heading = "La modification du facture";
      this.route.data
        .pipe(map(data => data.facture))
        .subscribe((facture: Facture) => {
          this.facture = facture;
          console.log(this.facture);
          this.factureForm = this.createEditForm(this.facture);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.factureForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.factureService.add(formData).subscribe((response: any) => {
        if (response.facture_id !== undefined && response.facture_id > 0) {
          this.toastr.success(
              `le facture a été ajouter avec succès avec ID: ${response.facture_id}`,
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
      this.factureService.edit(formData, this.facture.id)
          .subscribe((response: any) => {
            if (response.facture_id !== undefined && response.facture_id > 0) {
              this.toastr.success(
                  `le facture a été modifier avec succès`,
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
    return this.factureForm = this.fb.group({

     libele: [null], 
     montant: [null], 
    });
  }

  createEditForm(facture: Facture) {
    return this.factureForm = this.fb.group({

     libele: [facture.libele], 
     montant: [facture.montant], 
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


 