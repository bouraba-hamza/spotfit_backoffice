import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Partner } from "@app/@core/models/partner";
import { FormGroup, FormBuilder } from "@angular/forms";
import { PartnerService } from "@app/@core/http/partner.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-partner-form",
  templateUrl: "./partner-form.component.html",
  styleUrls: ["./partner-form.component.scss"],
  providers: [ToastrService]
})
export class PartnerFormComponent implements OnInit {
  heading: string;
  type: string;
  partner: Partner;
  partnerForm: FormGroup;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private partnerService: PartnerService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un partenaire";
      this.partnerForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un partenaire";
      this.route.data
        .pipe(map(data => data.partner))
        .subscribe((partner: Partner) => {
          this.partner = partner;
          this.partnerForm = this.createEditForm(this.partner);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.partnerForm.value));
    formValues.account = JSON.stringify(formValues.account);
    formValues.address = JSON.stringify(formValues.address);
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    if (this.type == "add") {
      this.partnerService.add(formData).subscribe((response: any) => {
        if (response.partner_id !== undefined && response.partner_id > 0) {
          this.toastr.success(
            `l'partenaire a ajouté avec succès avec ID: ${response.partner_id}`,
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
      this.partnerService
        .edit(formData, this.partner.id)
        .subscribe((response: any) => {
          if (response.partner_id !== undefined && response.partner_id > 0) {
            this.toastr.success(
              `l'partenaire a modifié avec succès`,
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

  createEditForm(partner: Partner) {
    return this.fb.group({
      firstName: [partner.firstName],
      lastName: [partner.lastName],
      birthDay: [partner.birthDay],
      gender: [partner.gender],
      phoneNumber: [partner.phoneNumber],
      cin: [partner.cin],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [partner.address.formattedAddress],
      }),
      account: this.fb.group({
        username: [partner.account.username],
        email: [partner.account.email],
        password: [null]
      })
    });
  }

  setAvatar(avatar: any) {
    try {
      this.partnerForm.patchValue({
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
