import {NgModule} from "@angular/core";
import {RouterModule, Routes} from "@angular/router";

const routes: Routes = [
    {
        path: 'home',
        loadChildren: () =>
        import("../dashboard/home/home.module").then(m => m.HomeModule)
    },
    
    {
        path: 'group',
        loadChildren: () =>
        import("../dashboard/group/group.module").then(m => m.GroupModule)
    },
    {
        path: 'pass',
        loadChildren: () =>
            import("./pass/pass.module").then(m => m.PassModule)

    },
    {
        path: 'class',
        loadChildren: () =>
            import('./class/class.module').then(m => m.ClassModule)

    },
    {
        path: 'activitie',
        loadChildren: () =>
        import("../dashboard/activitie/activitie.module").then(m => m.ActivitieModule)
    },
    
    {
        path: '',
        redirectTo: 'home',
    },
    {
        path: 'facilitie',
        loadChildren: () =>
        import("../dashboard/facilitie/facilitie.module").then(m => m.FacilitieModule)
    },
    {
        path: 'gym',
        loadChildren: () =>
        import("../dashboard/gym/gym.module").then(m => m.GymModule)
    },
    {
        path: 'equipement',
        loadChildren: () =>
        import("../dashboard/equipement/equipement.module").then(m => m.EquipementModule)
    },
    {
        path: 'facture',
        loadChildren: () =>
        import("../dashboard/facture/facture.module").then(m => m.FactureModule)
    },
    {
        path: 'admins',
        loadChildren: () =>
            import("../dashboard/admins/admins.module").then(m => m.AdminsModule)
    },
    {
        path: 'supervisors',
        loadChildren: () =>
            import("../dashboard/supervisors/supervisors.module").then(m => m.SupervisorsModule)
    },
    {
        path: 'receptionists',
        loadChildren: () =>
            import("../dashboard/receptionists/receptionists.module").then(m => m.ReceptionistsModule)
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
   /* {
        path: 'pass',
        loadChildren: () =>
            import("./pass/pass.module").then(m => m.PassModule)

    },*/
    {
        path: 'group',
        loadChildren: () =>
            import("../dashboard/group/group.module").then(m => m.GroupModule)
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
    },
    {
        path: 'settings',
        loadChildren: () => import("../dashboard/settings/settings.module").then(m => m.SettingsModule)
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class DashboardRoutingModule {
}
