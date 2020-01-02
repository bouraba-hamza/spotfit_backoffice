import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Receptionist } from "@app/@core/models/receptionist";
import { FormGroup, FormBuilder } from "@angular/forms";
import { ReceptionistService } from "@app/@core/http/receptionist.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';
import {GymService} from "@app/modules/dashboard/gyms/gym.service";
import {Gym} from "@app/modules/dashboard/gyms/gym";

@Component({
  selector: "app-receptionist-form",
  templateUrl: "./receptionist-form.component.html",
  styleUrls: ["./receptionist-form.component.scss"],
  providers: [ToastrService]
})
export class ReceptionistFormComponent implements OnInit {
  heading: string;
  type: string;
  receptionist: Receptionist;
  receptionistForm: FormGroup;
  inProgress: boolean = false;
  gyms: any[] = [];
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private receptionistService: ReceptionistService,
    private toastr: ToastrService,
    private underscore: UnderscoreService,
    private gymService: GymService,
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un Réceptionniste";
      this.receptionistForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un Réceptionniste";
      this.route.data
        .pipe(map(data => data.receptionist))
        .subscribe((receptionist: Receptionist) => {
          this.receptionist = receptionist;
          this.receptionistForm = this.createEditForm(this.receptionist);
        });
    }
  }

  ngOnInit() {
    this.gymService.getGyms().pipe(
        map((gyms) => {
          return gyms.map(gym => {
            return { id: gym.id, name: gym.name}
          });
        })
    ).subscribe(gyms => {
      this.gyms = gyms;
    });
  }

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.receptionistForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    this.inProgress = true;

    if (this.type == "add") {
      this.receptionistService.add(formData).subscribe((response: any) => {
        if (response.receptionist_id !== undefined && response.receptionist_id > 0) {
          this.toastr.success(
            `le Réceptionniste a ajouté avec succès avec ID: ${response.receptionist_id}`,
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
      this.receptionistService
        .edit(formData, this.receptionist.id)
        .subscribe((response: any) => {
          if (response.receptionist_id !== undefined && response.receptionist_id > 0) {
            this.toastr.success(
              `le Réceptionniste a modifié avec succès`,
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
      firstName: [null],
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
      }),
      gym_id: [null],
    });
  }

  createEditForm(receptionist: Receptionist) {
    return this.fb.group({
      firstName: [receptionist.firstName ? receptionist.firstName: ''],
      lastName: [receptionist.lastName ? receptionist.lastName: ''],
      birthDay: [receptionist.birthDay ? receptionist.birthDay: ''],
      gender: [receptionist.gender ? receptionist.gender: ''],
      phoneNumber: [receptionist.phoneNumber ? receptionist.phoneNumber: ''],
      cin: [receptionist.cin ? receptionist.cin : ''],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [receptionist.address ? receptionist.address.formattedAddress : ''],
      }),
      account: this.fb.group({
        username: [receptionist.account ? receptionist.account.username : ''],
        email: [receptionist.account ? receptionist.account.email : ''],
        password: [null]
      }),
      gym_id: receptionist.gym_id,
    });
  }

  setAvatar(avatar: any) {
    try {
      this.receptionistForm.patchValue({
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
