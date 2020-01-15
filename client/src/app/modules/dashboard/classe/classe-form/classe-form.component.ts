

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Classe } from "@app/@core/models/classe";
import { FormGroup, FormBuilder } from "@angular/forms";
import { ClasseService } from "@app/@core/http/classe.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-classe-form",
  templateUrl: "./classe-form.component.html",
  styleUrls: ["./classe-form.component.scss"],
  providers: [ToastrService]
})
export class ClasseFormComponent implements OnInit {
  heading: string;
  type: string;
  classe: Classe;
  classeForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private classeService: ClasseService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du classe";
      this.classeForm = this.createAddForm();
    } else {
      this.heading = "La modification du classe";
      this.route.data
        .pipe(map(data => data.classe))
        .subscribe((classe: Classe) => {
          this.classe = classe;
          console.log(this.classe);
          this.classeForm = this.createEditForm(this.classe);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.classeForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.classeService.add(formData).subscribe((response: any) => {
        if (response.classe_id !== undefined && response.classe_id > 0) {
          this.toastr.success(
              `le classe a été ajouter avec succès avec ID: ${response.classe_id}`,
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
      this.classeService.edit(formData, this.classe.id)
          .subscribe((response: any) => {
            if (response.classe_id !== undefined && response.classe_id > 0) {
              this.toastr.success(
                  `le classe a été modifier avec succès`,
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
    return this.classeForm = this.fb.group({

     name: [null], 
     image: [null], 
     prix_min: [null], 
     prix_max: [null], 
    });
  }

  createEditForm(classe: Classe) {
    return this.classeForm = this.fb.group({

     name: [classe.name], 
     image: [classe.image], 
     prix_min: [classe.prix_min], 
     prix_max: [classe.prix_max], 
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


 