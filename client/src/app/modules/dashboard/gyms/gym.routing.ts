import { GymComponent } from './gym.component';
import {Routes} from '@angular/router';

export const GymPageroute: Routes = [{
    path: '',
    component: GymComponent,
    data: {
        breadcrumb: 'Liste des gyms'
    }
}];
