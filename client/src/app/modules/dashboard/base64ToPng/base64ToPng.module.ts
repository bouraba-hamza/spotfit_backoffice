
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { Base64ToPngRoutingModule } from '@app/modules/dashboard/base64ToPng/base64ToPng-routing.module';
   import { Base64ToPngListComponent } from '@app/modules/dashboard/base64ToPng/base64ToPng-list/base64ToPng-list.component';
   import { Base64ToPngFormComponent } from '@app/modules/dashboard/base64ToPng/base64ToPng-form/base64ToPng-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';

   @NgModule({
     declarations: [Base64ToPngListComponent, Base64ToPngFormComponent],
     imports: [
   
       //generated_entitys,
       Base64ToPngRoutingModule,
   
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
   export class Base64ToPngModule { }
   
  