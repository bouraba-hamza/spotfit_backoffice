import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AdminscanComponent } from '@app/modules/dashboard/adminscan/adminscan.component';

const routes: Routes = [
  {
    path: '',
    component: AdminscanComponent,
    data: {
      title: 'Adminscan'
    },

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdminscanRoutingModule { }
