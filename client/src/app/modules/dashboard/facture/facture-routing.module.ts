

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { FactureListComponent } from "./facture-list/facture-list.component";
import { FactureResolverService } from './facture-resolver.service';
import { FactureFormComponent } from './facture-form/facture-form.component';
import { FactureFormResolverService } from './facture-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: FactureListComponent,
    resolve: {
      facturee: FactureResolverService
    }
  },
  {
    path: "form",
    component: FactureFormComponent,
    resolve: {
      facture: FactureFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FactureRoutingModule {}


 