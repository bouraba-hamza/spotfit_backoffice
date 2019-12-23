import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import { CommonModule } from '@angular/common';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {RouterModule} from '@angular/router';
import { MaterielService } from './materiel.service';
import { MaterielPageroute } from './materiel.routing';
import { MaterielComponent } from './materiel.component';
import { ReactiveFormsModule } from '@angular/forms';
import {RatingModule} from "ng-starrating";

@NgModule({
  imports: [
      CommonModule,
      HttpClientModule,
      RatingModule,
      RouterModule.forChild(MaterielPageroute),
      ReactiveFormsModule,
  ],
    declarations: [MaterielComponent],
    providers: [
        MaterielService
    ],
    schemas: [ CUSTOM_ELEMENTS_SCHEMA , NO_ERRORS_SCHEMA],

})
export class MaterielModule { }
