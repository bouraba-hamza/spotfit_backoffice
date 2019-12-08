import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GraphsComponent } from './pages/graphs/graphs.component';

const routes: Routes = [
  { path: '**', component: GraphsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
