import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Customer } from "@app/@core/models/customer";
import { FormGroup, FormBuilder } from "@angular/forms";
import { CustomerService } from "@app/@core/http/customer.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-customer-form",
  templateUrl: "./customer-form.component.html",
  styleUrls: ["./customer-form.component.scss"],
  providers: [ToastrService]
})
export class CustomerFormComponent implements OnInit {
  heading: string;
  type: string;
  customer: Customer;
  customerForm: FormGroup;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private customerService: CustomerService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout d'un pratenaire";
      this.customerForm = this.createAddForm();
    } else {
      this.heading = "L'modification d'un pratenaire";
      this.route.data
        .pipe(map(data => data.customer))
        .subscribe((customer: Customer) => {
          this.customer = customer;
          this.customerForm = this.createEditForm(this.customer);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.customerForm.value));
    formValues.account = JSON.stringify(formValues.account);
    formValues.address = JSON.stringify(formValues.address);
    let formData: FormData = this.underscore.objectToFormData(formValues);

    if (this.type == "add") {
      this.customerService.add(formData).subscribe((response: any) => {
        if (response.customer_id !== undefined && response.customer_id > 0) {
          this.toastr.success(
            `l'pratenaire a ajouté avec succès avec ID: ${response.customer_id}`,
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
      this.customerService
        .edit(formData, this.customer.id)
        .subscribe((response: any) => {
          if (response.customer_id !== undefined && response.customer_id > 0) {
            this.toastr.success(
              `l'pratenaire a modifié avec succès`,
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

  createEditForm(customer: Customer) {
    return this.fb.group({
      firstName: [customer.firstName],
      lastName: [customer.lastName],
      birthDay: [customer.birthDay],
      gender: [customer.gender],
      phoneNumber: [customer.phoneNumber],
      cin: [customer.cin],
      avatar: [null],
      address: this.fb.group({
        formattedAddress: [customer.address.formattedAddress],
      }),
      account: this.fb.group({
        username: [customer.account.username],
        email: [customer.account.email],
        password: [null]
      })
    });
  }

  setAvatar(avatar: any) {
    try {
      this.customerForm.patchValue({
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
