
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { FacilitieRoutingModule } from '@app/modules/dashboard/facilitie/facilitie-routing.module';
   import { FacilitieListComponent } from '@app/modules/dashboard/facilitie/facilitie-list/facilitie-list.component';
   import { FacilitieFormComponent } from '@app/modules/dashboard/facilitie/facilitie-form/facilitie-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';

   @NgModule({
     declarations: [FacilitieListComponent, FacilitieFormComponent],
     imports: [
   
       //generated_entitys,
       FacilitieRoutingModule,
   
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
     ],
     providers: [
       { provide: ToastrService } 
     ]
   })
   export class FacilitieModule { }
   
  