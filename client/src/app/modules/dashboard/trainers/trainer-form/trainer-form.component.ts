import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Trainer } from "@app/@core/models/trainer";
import { FormGroup, FormBuilder } from "@angular/forms";
import { TrainerService } from "@app/@core/http/trainer.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-trainer-form",
  templateUrl: "./trainer-form.component.html",
  styleUrls: ["./trainer-form.component.scss"],
  providers: [ToastrService]
})
export class TrainerFormComponent implements OnInit {
  heading: string;
  type: string;
  trainer: Trainer;
  trainerForm: FormGroup;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private trainerService: TrainerService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un entraîneur";
      this.trainerForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un entraîneur";
      this.route.data
        .pipe(map(data => data.trainer))
        .subscribe((trainer: Trainer) => {
          this.trainer = trainer;
          this.trainerForm = this.createEditForm(this.trainer);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.trainerForm.value));
    formValues.account = JSON.stringify(formValues.account);
    formValues.address = JSON.stringify(formValues.address);
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    if (this.type == "add") {
      this.trainerService.add(formData).subscribe((response: any) => {
        if (response.trainer_id !== undefined && response.trainer_id > 0) {
          this.toastr.success(
            `l'entraîneur a ajouté avec succès avec ID: ${response.trainer_id}`,
            this.heading,
            { timeOut: 5000 }
          );
          this.router.navigate(["../"], { relativeTo: this.route });
        } else {
          this.toastr.error(`${response.errors[0]}`, this.heading, {
            closeButton: true
          });
        }
      });
    } else {
      this.trainerService
        .edit(formData, this.trainer.id)
        .subscribe((response: any) => {
          if (response.trainer_id !== undefined && response.trainer_id > 0) {
            this.toastr.success(
              `l'entraîneur a modifié avec succès`,
              this.heading,
              { timeOut: 5000 }
            );
            this.router.navigate(["../"], { relativeTo: this.route });
          } else {
            this.toastr.error(`${response.errors[0]}`, this.heading, {
              closeButton: true
            });
          }
        });
    }
  }

  createAddForm() {
    return this.fb.group({
      firstName: [null],
      weight: [null],
      length: [null],
      lastName: [null],
      birthDay: [null],
      gender: ["m"],
      phoneNumber: [null],
      cin: [null],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [null],
      }),
      account: this.fb.group({
        username: [null],
        email: [null],
        password: [null]
      })
    });
  }

  createEditForm(trainer: Trainer) {
    return this.fb.group({
      firstName: [trainer.firstName],
      lastName: [trainer.lastName],
      weight: [trainer.weight],
      length: [trainer.length],
      birthDay: [trainer.birthDay],
      gender: [trainer.gender],
      phoneNumber: [trainer.phoneNumber],
      cin: [trainer.cin],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [trainer.address.formattedAddress],
      }),
      account: this.fb.group({
        username: [trainer.account.username],
        email: [trainer.account.email],
        password: [null]
      })
    });
  }

  setAvatar(avatar: any) {
    try {
      this.trainerForm.patchValue({
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
