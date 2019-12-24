import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import {VirtualScrollComponent} from "@app/modules/spotfit/pages/virtual-scroll/virtual-scroll.component";

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'virtual-scroll', component:  VirtualScrollComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SpotfitRoutingModule { }
