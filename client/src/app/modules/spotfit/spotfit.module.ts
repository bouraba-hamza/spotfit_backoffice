import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SpotfitRoutingModule } from './spotfit-routing.module';
import { HomeComponent } from './pages/home/home.component';

@NgModule({
  declarations: [HomeComponent],
  imports: [
    CommonModule,
    SpotfitRoutingModule
  ]
})
export class SpotfitModule { }
