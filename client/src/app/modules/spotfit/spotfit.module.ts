import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SpotfitRoutingModule } from './spotfit-routing.module';
import { HomeComponent } from './pages/home/home.component';
import { AngularGoogleMapsComponent } from './components/angular-google-maps/angular-google-maps.component';

import { AgmCoreModule } from '@agm/core';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {NgSelectModule} from "@ng-select/ng-select";
import {NgbRatingModule} from "@ng-bootstrap/ng-bootstrap";
import { VirtualScrollComponent } from './pages/virtual-scroll/virtual-scroll.component';
import {ScrollingModule} from "@angular/cdk/scrolling";

@NgModule({
  declarations: [HomeComponent, AngularGoogleMapsComponent, VirtualScrollComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    SpotfitRoutingModule,
    AgmCoreModule,
    ScrollingModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyDXuzcjaZ17frGIg9ZVR6ar9HexIHvBsPY',
      libraries: ['places'],
    }),
    NgSelectModule,
    NgbRatingModule
  ]
})
export class SpotfitModule { }
