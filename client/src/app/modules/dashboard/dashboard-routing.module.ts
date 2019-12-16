import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

const routes: Routes = [
  {
    path: "",
    redirectTo: "admins",
  },
  {
    path: "admins",
    loadChildren: () =>
      import("../dashboard/admins/admins.module").then(m => m.AdminsModule)
  },
  {
    path: "partners",
    loadChildren: () =>
      import("../dashboard/partners/partners.module").then(m => m.PartnersModule)
  },
  {
    path: "customers",
    loadChildren: () =>
      import("../dashboard/customers/customers.module").then(m => m.CustomersModule)
  },
  {
    path: "trainers",
    loadChildren: () =>
      import("../dashboard/trainers/trainers.module").then(m => m.TrainersModule)
  },
  {
    path: "calendar",
    loadChildren: () =>
      import("../dashboard/calendar/calendar.module").then(m => m.CalendarsModule)
  },
  {
    path: "chat",
    loadChildren: () =>
      import("../dashboard/chat/chat.module").then(m => m.ChatModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule {}
