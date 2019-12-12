import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { GraphsComponent } from "./pages/graphs/graphs.component";

const routes: Routes = [
  {
    path: "",
    redirectTo: "admins",
  },
  {
    path: "admins",
    loadChildren: () =>
      import("../dashboard/admins/admins.module").then(m => m.AdminsModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule {}
