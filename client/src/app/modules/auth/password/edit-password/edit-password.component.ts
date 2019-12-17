import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {ToastrService} from "ngx-toastr";
import {AuthService} from "@app/@core/services/auth.service";
import {UnderscoreService} from "@app/@core/services/underscore.service";
import {PasswordService} from "@app/@core/http/password.service";

@Component({
  selector: 'app-edit-password',
  templateUrl: './edit-password.component.html',
  styleUrls: ['./edit-password.component.scss']
})
export class EditPasswordComponent implements OnInit {
  editPasswordForm: FormGroup;
  errors: String[] = [];
  ticket: string;

  inProgress: boolean = false;

  constructor(private router: Router,
              private route: ActivatedRoute,private fb: FormBuilder,private toastr: ToastrService,
              private authService: AuthService, private underscore: UnderscoreService, private passwordService: PasswordService) {
    this.createEditPasswordForm();
    this.ticket = this.route.snapshot.paramMap.get("ticket");
  }

  // On submit click, reset form fields
  onSubmit() {
    if(!this.editPasswordForm.valid)
      return;

    this.inProgress = true;

    const data = { password: this.editPasswordForm.get("password").value, ticket: this.ticket };
    this.passwordService.update(data).subscribe((response: any) => {
      console.log(response);
      if (response.errors !== undefined) {
        this.errors = response.errors;
      } else if(response.status === "success") {
        this.toastr.success(
            "le nouveau mot de passe a bien configuré pour votre compte.",
            "Renouveller le mote de passe",
        );
        this.router.navigateByUrl('/login');
      }
    }, (error) => { console.error(error) }, () => { this.inProgress = false; });
  }

  createEditPasswordForm() {
    this.editPasswordForm = this.fb.group({
      password: [null, [Validators.required, Validators.minLength(6)]],
    });
  }
}
