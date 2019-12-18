import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import { CommonModule } from '@angular/common';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {RouterModule} from '@angular/router';
import { GymService } from './gym.service';
import { GymComponent } from './gym.component';
import { GymPageroute } from '@app/modules/dashboard/gyms/gym.routing';
import { ReactiveFormsModule } from '@angular/forms';
import { QRCodeModule } from 'angularx-qrcode';
import {RatingModule} from "ng-starrating";

@NgModule({
  imports: [
      CommonModule,
      HttpClientModule,
      RatingModule,
      ReactiveFormsModule,
      QRCodeModule,
      RouterModule.forChild(GymPageroute)
  ],
    declarations: [GymComponent],
    providers: [
        GymService
    ],
    schemas: [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA],

})
export class GymModule { }
