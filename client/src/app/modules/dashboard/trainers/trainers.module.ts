import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TrainersRoutingModule } from './trainers-routing.module';
import { TrainerListComponent } from './trainer-list/trainer-list.component';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import {MatChipsModule} from '@angular/material/chips';
import {MatMenuModule} from '@angular/material/menu';
import { TrainerFormComponent } from './trainer-form/trainer-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { SharedModule } from '@app/shared/shared.module';

@NgModule({
  declarations: [TrainerListComponent, TrainerFormComponent],
  imports: [
    CommonModule,
    TrainersRoutingModule,
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
export class TrainersModule { }
