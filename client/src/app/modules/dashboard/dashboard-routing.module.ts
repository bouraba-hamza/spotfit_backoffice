import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

const routes: Routes = [
  {
    path: '',
    redirectTo: 'admins',
  },
  {
    path: 'admins',
    loadChildren: () =>
      import("../dashboard/admins/admins.module").then(m => m.AdminsModule)
  },
  {
    path: 'partners',
    loadChildren: () =>
      import("../dashboard/partners/partners.module").then(m => m.PartnersModule)
  },
  {
    path: 'customers',
    loadChildren: () =>
      import("../dashboard/customers/customers.module").then(m => m.CustomersModule)
  },
  {
    path: 'trainers',
    loadChildren: () =>
      import("../dashboard/trainers/trainers.module").then(m => m.TrainersModule)
  },
  {
    path: 'calendar',
    loadChildren: () =>
      import("../dashboard/calendar/calendar.module").then(m => m.CalendarsModule)
  },
  {
    path: 'chat',
    loadChildren: () =>
      import("../dashboard/chat/chat.module").then(m => m.ChatModule)
  },
  {
    path: 'equipment',
    loadChildren: () =>
        import("./equipments/materiel.module").then(m => m.MaterielModule)

  },
  {
    path: 'gyms',
    loadChildren: () =>
        import("../dashboard/gyms/gym.module").then(m => m.GymModule)
  },
  // {
  //   path: 'home',
  //   loadChildren: () =>
  //       import("../dashboard/trainers/trainers.module").then(m => m.TrainersModule)
  //
  //   component: HomeComponent, data: { title: 'Accueil' }
  // },
  {
    path: 'profile',
    loadChildren: () =>
        import("../dashboard/profile/profile.module").then(m => m.ProfileModule)
  },
  {
    path: 'adminscan',
    loadChildren: () =>
        import("../dashboard/adminscan/adminscan.module").then(m => m.AdminscanModule)
  },
  {
    path: 'robot',
    loadChildren: () =>
        import("../dashboard/robot/robot.module").then(m => m.RobotModule)
  },
  {
    path: 'documentation',
    loadChildren: () =>
        import("../dashboard/documentation/documentation.module").then(m => m.DocumentationModule)
  },
  {
    path: 'support',
    loadChildren: () =>
        import("../dashboard/support/support.module").then(m => m.SupportModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule {}
