

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { EquipementListComponent } from "./equipement-list/equipement-list.component";
import { EquipementResolverService } from './equipement-resolver.service';
import { EquipementFormComponent } from './equipement-form/equipement-form.component';
import { EquipementFormResolverService } from './equipement-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: EquipementListComponent,
    resolve: {
      equipemente: EquipementResolverService
    }
  },
  {
    path: "form",
    component: EquipementFormComponent,
    resolve: {
      equipement: EquipementFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EquipementRoutingModule {}


 