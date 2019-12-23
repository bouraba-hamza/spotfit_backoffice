import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminscanRoutingModule } from './adminscan-routing.module';
import { AdminscanComponent } from '@app/modules/dashboard/adminscan/adminscan.component';

import { NgQrScannerModule } from 'angular2-qrscanner';
import { QRCodeModule } from 'angularx-qrcode';

import { FormsModule } from '@angular/forms';
@NgModule({
    imports: [
        CommonModule,
        AdminscanRoutingModule,
        FormsModule,
        QRCodeModule,
        NgQrScannerModule
    ],
    declarations: [
        AdminscanComponent
    ]
})
export class AdminscanModule { }
