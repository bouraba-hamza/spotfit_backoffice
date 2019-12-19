import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '@app/@core/guards/auth.guard';
import {MaterielComponent} from "@app/modules/dashboard/equipments/materiel.component";
import {HomeComponent} from "@app/modules/spotfit/pages/home/home.component";
import {ProfileComponent} from "@app/modules/dashboard/profile/profile.component";
import {GymComponent} from "@app/modules/dashboard/gyms/gym.component";
import {RobotComponent} from "@app/modules/dashboard/robot/robot.component";
import {DocumentationComponent} from "@app/modules/dashboard/documentation/documentation.component";
import {SupportComponent} from "@app/modules/dashboard/support/support.component";
import {AdminscanComponent} from "@app/modules/dashboard/adminscan/adminscan.component";

//Route for content layout with sidebar, navbar and footer
export const Full_ROUTES: Routes = [
  {
    path: 'dashboard',
    loadChildren: () => import('../../modules/dashboard/dashboard.module').then(m => m.DashboardModule),
    canActivate: [AuthGuard]
  },
  // {
  //   path: 'materiel', component: MaterielComponent, data: { title: 'Materiels' }
  // },
  // {
  //   path: 'gyms', component: GymComponent, data: { title: 'Gyms' }
  // },
  // {
  //   path: 'home', component: HomeComponent, data: { title: 'Accueil' }
  // },
  // {
  //   path: 'profile', component: ProfileComponent, data: { title: 'Profile' }
  // },
  // {
  //   path: 'adminscan', component: AdminscanComponent, data: { title: 'Admin Scan' }
  // },
  // {
  //   path: 'robot', component: RobotComponent, data: { title: 'Robot AI' }
  // },
  // {
  //   path: 'documentation', component: DocumentationComponent, data: { title: 'Documentation' }
  // },
  // {
  //   path: 'support', component: SupportComponent, data: { title: 'Support' }
  // }
];
