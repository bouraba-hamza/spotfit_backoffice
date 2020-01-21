import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { SupervisorListComponent } from "./supervisor-list/supervisor-list.component";
import { SupervisorResolverService } from './supervisor-resolver.service';
import { SupervisorFormComponent } from './supervisor-form/supervisor-form.component';
import { SupervisorFormResolverService } from './supervisor-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: SupervisorListComponent,
    resolve: {
      supervisors: SupervisorResolverService
    }
  },
  {
    path: "form",
    component: SupervisorFormComponent,
    resolve: {
      supervisor: SupervisorFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SupervisorsRoutingModule {}
