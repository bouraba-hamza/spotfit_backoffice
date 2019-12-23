import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SupportRoutingModule } from '@app/modules/dashboard/support/support-routing.module';
import { SupportComponent } from '@app/modules/dashboard/support/support.component';
import { FormsModule } from '@angular/forms';

@NgModule({
    imports: [
        CommonModule,
        SupportRoutingModule,
        FormsModule
    ],
    declarations: [
        SupportComponent
    ]
})

export class SupportModule { }
