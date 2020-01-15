import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReceptionistsRoutingModule } from './receptionists-routing.module';
import { ReceptionistListComponent } from './receptionist-list/receptionist-list.component';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import {MatChipsModule} from '@angular/material/chips';
import {MatMenuModule} from '@angular/material/menu';
import { ReceptionistFormComponent } from './receptionist-form/receptionist-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { SharedModule } from '@app/shared/shared.module';
import { GymService } from '@app/@core/http/gym.service';


@NgModule({
  declarations: [ReceptionistListComponent, ReceptionistFormComponent],
  imports: [
    CommonModule,
    ReceptionistsRoutingModule,
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
    { provide: ToastrService },
      GymService,
  ]
})
export class ReceptionistsModule { }
