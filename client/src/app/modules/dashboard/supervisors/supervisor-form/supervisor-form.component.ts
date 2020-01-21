import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Supervisor } from "@app/@core/models/supervisor";
import { FormGroup, FormBuilder } from "@angular/forms";
import { SupervisorService } from "@app/@core/http/supervisor.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';
import { GymService } from '@app/@core/http/gym.service';
import { Gym } from '@app/@core/models/gym';
import { Observable } from '../../../../../../node_modules/rxjs/Observable';


@Component({
  selector: "app-supervisor-form",
  templateUrl: "./supervisor-form.component.html",
  styleUrls: ["./supervisor-form.component.scss"],
  providers: [ToastrService]
})
export class SupervisorFormComponent implements OnInit {
  heading: string;
  type: string;
  supervisor: Supervisor;
  supervisorForm: FormGroup;
  inProgress: boolean = false;
  gyms: Observable<Gym>;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private supervisorService: SupervisorService,
    private toastr: ToastrService,
    private underscore: UnderscoreService,
    private gymService: GymService,
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un superviseur";
      this.supervisorForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un superviseur";
      this.route.data
        .pipe(map(data => data.supervisor))
        .subscribe((supervisor: Supervisor) => {
          this.supervisor = supervisor;
          this.supervisorForm = this.createEditForm(this.supervisor);
        });
    }
  }

  ngOnInit() {
    this.gymService.getGyms().pipe(
      map((gyms: any) => {
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
    let formValues = this.removeEmpty(Object.assign({}, this.supervisorForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    this.inProgress = true;

    if (this.type == "add") {
      this.supervisorService.add(formData).subscribe((response: any) => {
        if (response.supervisor_id !== undefined && response.supervisor_id > 0) {
          this.toastr.success(
            `le superviseur a ajouté avec succès avec ID: ${response.supervisor_id}`,
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
      this.supervisorService
        .edit(formData, this.supervisor.id)
        .subscribe((response: any) => {
          if (response.supervisor_id !== undefined && response.supervisor_id > 0) {
            this.toastr.success(
              `le superviseur a modifié avec succès`,
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

  createEditForm(supervisor: Supervisor) {
    return this.fb.group({
      firstName: [supervisor.firstName ? supervisor.firstName: ''],
      lastName: [supervisor.lastName ? supervisor.lastName: ''],
      birthDay: [supervisor.birthDay ? supervisor.birthDay: ''],
      gender: [supervisor.gender ? supervisor.gender: ''],
      phoneNumber: [supervisor.phoneNumber ? supervisor.phoneNumber: ''],
      cin: [supervisor.cin ? supervisor.cin : ''],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [supervisor.address ? supervisor.address.formattedAddress : ''],
      }),
      account: this.fb.group({
        username: [supervisor.account ? supervisor.account.username : ''],
        email: [supervisor.account ? supervisor.account.email : ''],
        password: [null]
      }),
      gym_id: supervisor.gym_id,
    });
  }

  setAvatar(avatar: any) {
    try {
      this.supervisorForm.patchValue({
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
