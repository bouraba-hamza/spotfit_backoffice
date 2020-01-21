

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { GymListComponent } from "./gym-list/gym-list.component";
import { GymResolverService } from './gym-resolver.service';
import { GymFormComponent } from './gym-form/gym-form.component';
import { GymFormResolverService } from './gym-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: GymListComponent,
    resolve: {
      gyme: GymResolverService
    }
  },
  {
    path: "form",
    component: GymFormComponent,
    resolve: {
      gym: GymFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class GymRoutingModule {}


 