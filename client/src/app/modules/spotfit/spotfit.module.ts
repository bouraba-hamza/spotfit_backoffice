import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SpotfitRoutingModule } from './spotfit-routing.module';
import { HomeComponent } from './pages/home/home.component';
import { AngularGoogleMapsComponent } from './components/angular-google-maps/angular-google-maps.component';

import { AgmCoreModule } from '@agm/core';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {NgSelectModule} from "@ng-select/ng-select";
import {NgbRatingModule} from "@ng-bootstrap/ng-bootstrap";
import {ScrollingModule} from "@angular/cdk/scrolling";
import { SubscriptionCardComponent } from './components/subscription-card/subscription-card.component';
import { SubscriptionCollectionComponent } from './pages/subscription-collection/subscription-collection.component';
import {FlexLayoutModule} from "@angular/flex-layout";

@NgModule({
  declarations: [HomeComponent, AngularGoogleMapsComponent, SubscriptionCardComponent, SubscriptionCollectionComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    SpotfitRoutingModule,
    AgmCoreModule,
    ScrollingModule,
    FlexLayoutModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyDXuzcjaZ17frGIg9ZVR6ar9HexIHvBsPY',
      libraries: ['places'],
    }),
    NgSelectModule,
    NgbRatingModule
  ]
})
export class SpotfitModule { }
