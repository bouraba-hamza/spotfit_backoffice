import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { RobotComponent } from '@app/modules/dashboard/robot/robot.component';

const routes: Routes = [
  {
    path: '',
    component: RobotComponent,
    data: {
      title: 'Robot'
    },

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class RobotRoutingModule { }
