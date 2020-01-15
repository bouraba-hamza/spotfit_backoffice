
   import { NgModule } from '@angular/core';
   import { CommonModule } from '@angular/common';
   
   import {MatButtonModule} from '@angular/material/button';
   import {MatTableModule} from '@angular/material/table';
   import {MatPaginatorModule} from '@angular/material/paginator';
   import {MatIconModule} from '@angular/material/icon';
   import {MatChipsModule} from '@angular/material/chips';
   import {MatMenuModule} from '@angular/material/menu';

   import { GroupRoutingModule } from '@app/modules/dashboard/group/group-routing.module';
   import { GroupListComponent } from '@app/modules/dashboard/group/group-list/group-list.component';
   import { GroupFormComponent } from '@app/modules/dashboard/group/group-form/group-form.component';
   
   import { FormsModule, ReactiveFormsModule } from '@angular/forms';
   import { ToastrModule, ToastrService } from 'ngx-toastr';
   import { SharedModule } from '@app/shared/shared.module';

   @NgModule({
     declarations: [GroupListComponent, GroupFormComponent],
     imports: [
   
       //generated_entitys,
       GroupRoutingModule,
   
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
   export class GroupModule { }
   
  