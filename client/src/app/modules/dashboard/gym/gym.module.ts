
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { GymRoutingModule } from '@app/modules/dashboard/gym/gym-routing.module';
   import { GymListComponent } from '@app/modules/dashboard/gym/gym-list/gym-list.component';
   import { GymFormComponent } from '@app/modules/dashboard/gym/gym-form/gym-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';


   //calendar
   import { NgbModalModule, NgbDatepickerModule, NgbTimepickerModule } from '@ng-bootstrap/ng-bootstrap';
   import { CalendarModule, DateAdapter } from 'angular-calendar';
   import { adapterFactory } from 'angular-calendar/date-adapters/date-fns';
   import { DateTimePickerComponent } from './date-time-picker.component';

   import { PdfViewerModule } from 'ng2-pdf-viewer'; 
    
     import { QRCodeModule } from 'angularx-qrcode';
     import { RatingModule } from '../../../../../node_modules/ng-starrating';

   @NgModule({
     declarations: [GymListComponent, GymFormComponent, DateTimePickerComponent],
     imports: [

       PdfViewerModule,
       RatingModule,
       QRCodeModule,
   
       //generated_entitys,
       GymRoutingModule,
   
       CommonModule,
       FormsModule,
       ReactiveFormsModule,
   
       // Material
       MatButtonModule,
       MatTableModule,
       MatPaginatorModule,
       MatIconModule,
       MatChipsModule,
       MatMenuModule,
   
       // Toastr
       ToastrModule.forRoot(),
   
       // Shared
       SharedModule,

       //calendar
       
       CalendarModule.forRoot({
        provide: DateAdapter,
        useFactory: adapterFactory
      }),
       NgbModalModule.forRoot(),
       NgbDatepickerModule.forRoot(),
       NgbTimepickerModule.forRoot(),
       FormsModule
     ],
     providers: [
       { provide: ToastrService } 
     ]
   })
   export class GymModule { }
   
  