
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { EquipementRoutingModule } from '@app/modules/dashboard/equipement/equipement-routing.module';
   import { EquipementListComponent } from '@app/modules/dashboard/equipement/equipement-list/equipement-list.component';
   import { EquipementFormComponent } from '@app/modules/dashboard/equipement/equipement-form/equipement-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';

   @NgModule({
     declarations: [EquipementListComponent, EquipementFormComponent],
     imports: [
   
       //generated_entitys,
       EquipementRoutingModule,
   
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
   export class EquipementModule { }
   
  