

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ClasseListComponent } from "./classe-list/classe-list.component";
import { ClasseResolverService } from './classe-resolver.service';
import { ClasseFormComponent } from './classe-form/classe-form.component';
import { ClasseFormResolverService } from './classe-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: ClasseListComponent,
    resolve: {
      classee: ClasseResolverService
    }
  },
  {
    path: "form",
    component: ClasseFormComponent,
    resolve: {
      classe: ClasseFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ClasseRoutingModule {}


 