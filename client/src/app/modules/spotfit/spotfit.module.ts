import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SpotfitRoutingModule } from './spotfit-routing.module';
import { HomeComponent } from './pages/home/home.component';
import { AngularGoogleMapsComponent } from './components/angular-google-maps/angular-google-maps.component';

import { AgmCoreModule } from '@agm/core';

@NgModule({
  declarations: [HomeComponent, AngularGoogleMapsComponent],
  imports: [
    CommonModule,
    SpotfitRoutingModule,
    AgmCoreModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyDXuzcjaZ17frGIg9ZVR6ar9HexIHvBsPY',
      libraries: ['places'],
    })
  ]
})
export class SpotfitModule { }
