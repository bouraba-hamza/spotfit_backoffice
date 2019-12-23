import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RobotRoutingModule } from './robot-routing.module';
import { RobotComponent } from './robot.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
    imports: [
        CommonModule,
        RobotRoutingModule,
        FormsModule,
        ReactiveFormsModule,
    ],
    declarations: [
      RobotComponent
    ]
})

export class RobotModule { }
