import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ReceptionistListComponent } from "./receptionist-list/receptionist-list.component";
import { ReceptionistResolverService } from './receptionist-resolver.service';
import { ReceptionistFormComponent } from './receptionist-form/receptionist-form.component';
import { ReceptionistFormResolverService } from './receptionist-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: ReceptionistListComponent,
    resolve: {
      receptionists: ReceptionistResolverService
    }
  },
  {
    path: "form",
    component: ReceptionistFormComponent,
    resolve: {
      receptionist: ReceptionistFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReceptionistsRoutingModule {}
