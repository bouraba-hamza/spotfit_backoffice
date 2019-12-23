import { Component, ViewChild } from '@angular/core';
import {FormBuilder, FormGroup, NgForm, Validators} from '@angular/forms';
import { Router, ActivatedRoute } from "@angular/router";
import {AuthService} from "@app/@core/services/auth.service";
import {UnderscoreService} from "@app/@core/services/underscore.service";
import {PasswordService} from "@app/@core/http/password.service";
import {ToastrService} from "ngx-toastr";

@Component({
    selector: 'app-forgot-password-page',
    templateUrl: './forgot-password-page.component.html',
    styleUrls: ['./forgot-password-page.component.scss'],
    providers: [ToastrService]
})

export class ForgotPasswordPageComponent {
    forogtPasswordForm: FormGroup;
    errors: String[] = [];

    inProgress: boolean = false;

    constructor(private router: Router,
        private route: ActivatedRoute,private fb: FormBuilder,private toastr: ToastrService,
                private authService: AuthService, private underscore: UnderscoreService, private passwordService: PasswordService) {
        this.createForgotPasswordForm();
    }

    // On submit click, reset form fields
    onSubmit() {
        if(!this.forogtPasswordForm.valid)
            return;

        this.inProgress = true;

        this.passwordService.resetPassword(this.forogtPasswordForm.get("email").value).subscribe((response: any) => {
            if (response.errors !== undefined) {
                this.errors = response.errors;
            } else if(response.status === "success") {
                this.toastr.success(
                    "vérifier votre boîte de réception pour completer l'operatoin",
                    "Récupérer le mot de passe",
                );
                this.router.navigateByUrl('/login');
            }
        }, (error) => { console.error(error) }, () => { this.inProgress = false; });
    }

    createForgotPasswordForm() {
        this.forogtPasswordForm = this.fb.group({
            email: [null, Validators.required],
        });
    }

    // On login link click
    onLogin() {
        this.router.navigate(['login'], { relativeTo: this.route.parent });
    }
}
