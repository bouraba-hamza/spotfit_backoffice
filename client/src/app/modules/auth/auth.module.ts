import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";

import { AuthRoutingModule } from "./auth-routing.module";
import { LoginComponent } from "./login/login.component";
import { RegisterComponent } from "./register/register.component";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { ForgotPasswordPageComponent } from './password/forgot-password/forgot-password-page.component';
import { EditPasswordComponent } from './password/edit-password/edit-password.component';

@NgModule({
  declarations: [LoginComponent, RegisterComponent, ForgotPasswordPageComponent, EditPasswordComponent],
  imports: [CommonModule, AuthRoutingModule, FormsModule, ReactiveFormsModule]
})
export class AuthModule {}
