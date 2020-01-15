

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { GroupListComponent } from "./group-list/group-list.component";
import { GroupResolverService } from './group-resolver.service';
import { GroupFormComponent } from './group-form/group-form.component';
import { GroupFormResolverService } from './group-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: GroupListComponent,
    resolve: {
      groupe: GroupResolverService
    }
  },
  {
    path: "form",
    component: GroupFormComponent,
    resolve: {
      group: GroupFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class GroupRoutingModule {}


 