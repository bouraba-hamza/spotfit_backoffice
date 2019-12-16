import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Admin } from "@app/@core/models/admin";
import { FormGroup, FormBuilder } from "@angular/forms";
import { AdminService } from "@app/@core/http/admin.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-admin-form",
  templateUrl: "./admin-form.component.html",
  styleUrls: ["./admin-form.component.scss"],
  providers: [ToastrService]
})
export class AdminFormComponent implements OnInit {
  heading: string;
  type: string;
  admin: Admin;
  adminForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private adminService: AdminService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un administrateur";
      this.adminForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un administrateur";
      this.route.data
        .pipe(map(data => data.admin))
        .subscribe((admin: Admin) => {
          this.admin = admin;
          this.adminForm = this.createEditForm(this.admin);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.adminForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    this.inProgress = true;

    if (this.type == "add") {
      this.adminService.add(formData).subscribe((response: any) => {
        if (response.admin_id !== undefined && response.admin_id > 0) {
          this.toastr.success(
            `l'administrateur a ajouté avec succès avec ID: ${response.admin_id}`,
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
      this.adminService
        .edit(formData, this.admin.id)
        .subscribe((response: any) => {
          if (response.admin_id !== undefined && response.admin_id > 0) {
            this.toastr.success(
              `l'administrateur a modifié avec succès`,
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
      })
    });
  }

  createEditForm(admin: Admin) {
    return this.fb.group({
      firstName: [admin.firstName],
      lastName: [admin.lastName],
      birthDay: [admin.birthDay],
      gender: [admin.gender],
      phoneNumber: [admin.phoneNumber],
      cin: [admin.cin],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [admin.address.formattedAddress],
      }),
      account: this.fb.group({
        username: [admin.account.username],
        email: [admin.account.email],
        password: [null]
      })
    });
  }

  setAvatar(avatar: any) {
    try {
      this.adminForm.patchValue({
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
