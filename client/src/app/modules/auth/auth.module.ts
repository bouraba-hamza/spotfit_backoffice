import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";

import { AuthRoutingModule } from "./auth-routing.module";
import { LoginComponent } from "./login/login.component";
import { RegisterComponent } from "./register/register.component";
import { FormsModule } from "@angular/forms";
import { ForgotPasswordPageComponent } from './forgot-password/forgot-password-page.component';

@NgModule({
  declarations: [LoginComponent, RegisterComponent, ForgotPasswordPageComponent],
  imports: [CommonModule, AuthRoutingModule, FormsModule]
})
export class AuthModule {}
