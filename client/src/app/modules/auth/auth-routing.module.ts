import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {LoginComponent} from './login/login.component';
import {RegisterComponent} from './register/register.component';
import {ForgotPasswordPageComponent} from './password/forgot-password/forgot-password-page.component';
import {EditPasswordComponent} from "@app/modules/auth/password/edit-password/edit-password.component";
import {EditPasswordResolverService} from "@app/modules/auth/password/edit-password/edit-password-resolver.service";

const routes: Routes = [
    {path: 'login', component: LoginComponent,},
    {path: 'register', component: RegisterComponent},
    {path: 'forgotpassword', component: ForgotPasswordPageComponent},
    {
        path: 'editpassword/:ticket', component: EditPasswordComponent, resolve: {
            EditPasswordResolverService
        }
    },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AuthRoutingModule {
}
