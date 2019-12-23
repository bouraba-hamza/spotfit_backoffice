import { MaterielComponent } from './materiel.component';
import {Routes} from '@angular/router';

export const MaterielPageroute: Routes = [{
    path: '',
    component: MaterielComponent,
    data: {
        breadcrumb: 'Liste des équipements'
    }
}];
