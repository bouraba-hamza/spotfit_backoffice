import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SupervisorsRoutingModule } from './supervisors-routing.module';
import { SupervisorListComponent } from './supervisor-list/supervisor-list.component';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import {MatChipsModule} from '@angular/material/chips';
import {MatMenuModule} from '@angular/material/menu';
import { SupervisorFormComponent } from './supervisor-form/supervisor-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { SharedModule } from '@app/shared/shared.module';
import { GymService } from '@app/@core/http/gym.service';

@NgModule({
  declarations: [SupervisorListComponent, SupervisorFormComponent],
  imports: [
    CommonModule,
    SupervisorsRoutingModule,
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
export class SupervisorsModule { }
