

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ActivitieListComponent } from "./activitie-list/activitie-list.component";
import { ActivitieResolverService } from './activitie-resolver.service';
import { ActivitieFormComponent } from './activitie-form/activitie-form.component';
import { ActivitieFormResolverService } from './activitie-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: ActivitieListComponent,
    resolve: {
      activitiee: ActivitieResolverService
    }
  },
  {
    path: "form",
    component: ActivitieFormComponent,
    resolve: {
      activitie: ActivitieFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ActivitieRoutingModule {}


 