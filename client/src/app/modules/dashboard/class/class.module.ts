import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {ClassRoutingModule} from './class-routing.module';
import {ClassListComponent} from './class-list/class-list.component';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import {MatChipsModule} from '@angular/material/chips';
import {MatMenuModule} from '@angular/material/menu';
import {ClassFormComponent} from './class-form/class-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { SharedModule } from '@app/shared/shared.module';

@NgModule({
  declarations: [ClassListComponent, ClassFormComponent],
  imports: [
    CommonModule,
    ClassRoutingModule,
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
export class ClassModule { }
