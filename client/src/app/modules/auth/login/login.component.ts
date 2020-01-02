import {Component, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {AuthService} from '@app/@core/services/auth.service';
import {ApiService} from "@app/@core/services/api.service";
import {HttpErrorResponse} from "@angular/common/http";
import {SubSink} from "subsink";

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnDestroy, OnInit {

    loginForm: FormGroup;
    errors: String[] = [];
    subs = new SubSink();

    constructor(
        private router: Router,
        private route: ActivatedRoute,
        private fb: FormBuilder,
        private authService: AuthService,
        private apiService: ApiService
    ) {
        this.createAddForm();
    }

    ngOnInit(): void {
        this.subs.add(
            this.apiService.httpErrors.subscribe((errors: HttpErrorResponse) => {
                if (errors.status === 403 && errors.error.message === 'User does not have the right roles.') {
                    this.errors = [errors.error.message];
                }
            })
        )
    }

    onSubmit() {
        // this.loginForm.reset();
        if (this.loginForm.valid) {
            const credentials = this.loginForm.value;
            this.authService.attemptAuth(credentials).subscribe(response => {
                if (response.errors !== undefined) {
                    this.errors = response.errors;
                } else {
                    this.router.navigateByUrl('dashboard/admins');
                }
            });
        }
    }

    createAddForm() {
        this.loginForm = this.fb.group({
            username: [null, Validators.required],
            password: [null, Validators.required],
            rememberMe: [false]
        });
    }

    // On Forgot password link click
    onForgotPassword() {
        this.router.navigate(['forgotpassword'], {relativeTo: this.route.parent});
    }

    ngOnDestroy() {
        this.subs.unsubscribe();
    }
}
