import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SupportComponent } from '@app/modules/dashboard/support/support.component';

const routes: Routes = [
  {
    path: '',
    component: SupportComponent,
    data: {
      title: 'Support'
    },

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SupportRoutingModule { }
