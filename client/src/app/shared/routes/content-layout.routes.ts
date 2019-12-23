import { Routes, RouterModule } from '@angular/router';

//Route for content layout without sidebar, navbar and footer for pages like Login, Registration etc...

export const CONTENT_ROUTES: Routes = [
    {
        path: 'home',
        loadChildren: () => import('../../modules/spotfit/spotfit.module').then(m => m.SpotfitModule)
    },
    {
        path: '',
        loadChildren: () => import('../../modules/auth/auth.module').then(m => m.AuthModule)
    }
];
