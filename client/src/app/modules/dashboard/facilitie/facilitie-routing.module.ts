

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { FacilitieListComponent } from "./facilitie-list/facilitie-list.component";
import { FacilitieResolverService } from './facilitie-resolver.service';
import { FacilitieFormComponent } from './facilitie-form/facilitie-form.component';
import { FacilitieFormResolverService } from './facilitie-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: FacilitieListComponent,
    resolve: {
      facilitiee: FacilitieResolverService
    }
  },
  {
    path: "form",
    component: FacilitieFormComponent,
    resolve: {
      facilitie: FacilitieFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FacilitieRoutingModule {}


 