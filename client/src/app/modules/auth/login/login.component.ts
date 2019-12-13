import { Component, ViewChild } from "@angular/core";
import { NgForm, FormGroup, FormBuilder, Validators } from "@angular/forms";
import { Router, ActivatedRoute } from "@angular/router";
import { AuthService } from "@app/@core/services/auth.service";

@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"]
})
export class LoginComponent {
  loginForm: FormGroup;
  errors: String[] = [];

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private authService: AuthService
  ) {
    this.createAddForm();
  }

  onSubmit() {
    // this.loginForm.reset();
    if (this.loginForm.valid) {
      const credentials = this.loginForm.value;
      this.authService.attemptAuth(credentials).subscribe(response => {
        if (response.errors !== undefined) {
          this.errors = response.errors;
        } else {
          this.router.navigateByUrl("dashboard/admins");
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
    this.router.navigate(["forgotpassword"], { relativeTo: this.route.parent });
  }
}
