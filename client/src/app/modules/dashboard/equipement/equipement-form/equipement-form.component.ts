

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Equipement } from "@app/@core/models/equipement";
import { FormGroup, FormBuilder } from "@angular/forms";
import { EquipementService } from "@app/@core/http/equipement.service";
import { Gym } from "@app/@core/models/gym";
import { GymService } from "@app/@core/http/gym.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-equipement-form",
  templateUrl: "./equipement-form.component.html",
  styleUrls: ["./equipement-form.component.scss"],
  providers: [ToastrService]
})
export class EquipementFormComponent implements OnInit {
  heading: string;
  type: string;
  equipement: Equipement;
  equipementForm: FormGroup;
  inProgress: boolean = false;

  gyms: [Gym] ;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private equipementService: EquipementService,
    private gymService: GymService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du equipement";
      this.equipementForm = this.createAddForm();
    } else {
      this.heading = "La modification du equipement";
      this.route.data
        .pipe(map(data => data.equipement))
        .subscribe((equipement: Equipement) => {
          this.equipement = equipement;
          console.log(this.equipement);
          this.equipementForm = this.createEditForm(this.equipement);
        });
    }
  }

  ngOnInit() {
    this.load_all_gyms();
  }

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.equipementForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.equipementService.add(formData).subscribe((response: any) => {
        if (response.equipement_id !== undefined && response.equipement_id > 0) {
          this.toastr.success(
              `le equipement a été ajouter avec succès avec ID: ${response.equipement_id}`,
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
      this.equipementService.edit(formData, this.equipement.id)
          .subscribe((response: any) => {
            if (response.equipement_id !== undefined && response.equipement_id > 0) {
              this.toastr.success(
                  `le equipement a été modifier avec succès`,
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
    return this.equipementForm = this.fb.group({

     libelle: [null], 
     rate: [null], 
     gym_id: [null], 
    });
  }

  createEditForm(equipement: Equipement) {
    return this.equipementForm = this.fb.group({

     libelle: [equipement.libelle], 
     rate: [equipement.rate], 
     gym_id: [equipement.gym_id], 
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


  load_all_gyms() {
    this.gymService.findAll().subscribe((response: any) => {
      // if (response.group_id !== undefined && response.group_id > 0) {
        if (response !== undefined ) {
          console.log('load_all_gyms');
          console.log(response);
          this.gyms = response;
         // this.cdRef.detectChanges(); // angular refresh image view
        //  this.all_groups = JSON.parse(JSON.stringify(response));
        } else {
          this.toastr.error(`${response.errors[0]}`, this.heading, {
            closeButton: true
          });
        }
      }, (error) => { console.error(error)}, () => { this.inProgress = false; });
    
  }


}


 