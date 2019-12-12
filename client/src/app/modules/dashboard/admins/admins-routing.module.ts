import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { AdminListComponent } from "./admin-list/admin-list.component";
import { AdminResolverService } from './admin-resolver.service';
import { AdminFormComponent } from './admin-form/admin-form.component';
import { AdminFormResolverService } from './admin-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: AdminListComponent,
    resolve: {
      admins: AdminResolverService
    }
  },
  {
    path: "form",
    component: AdminFormComponent,
    resolve: {
      admin: AdminFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminsRoutingModule {}
