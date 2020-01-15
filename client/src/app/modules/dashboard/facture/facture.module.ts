
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { FactureRoutingModule } from '@app/modules/dashboard/facture/facture-routing.module';
   import { FactureListComponent } from '@app/modules/dashboard/facture/facture-list/facture-list.component';
   import { FactureFormComponent } from '@app/modules/dashboard/facture/facture-form/facture-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';

   @NgModule({
     declarations: [FactureListComponent, FactureFormComponent],
     imports: [
   
       //generated_entitys,
       FactureRoutingModule,
   
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
   export class FactureModule { }
   
  