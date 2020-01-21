import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { PassListComponent } from "./pass-list/pass-list.component";
import { PassResolverService } from './pass-resolver.service';
import { PassFormComponent } from './pass-form/pass-form.component';
import { PassFormResolverService } from './pass-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: PassListComponent,
    resolve: {
      passe: PassResolverService
    }
  },
  {
    path: "form",
    component: PassFormComponent,
    resolve: {
      pass: PassFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PassRoutingModule {}
