import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeRoutingModule } from '@app/modules/dashboard/home/home-routing.module';
import { HomeComponent } from '@app/modules/dashboard/home/home.component';
import { FormsModule } from '@angular/forms';

@NgModule({
    imports: [
        CommonModule,
        HomeRoutingModule,
        FormsModule
    ],
    declarations: [
        HomeComponent
    ]
})

export class HomeModule { }
