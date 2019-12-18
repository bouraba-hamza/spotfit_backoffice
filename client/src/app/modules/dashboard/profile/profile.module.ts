import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProfileRoutingModule } from './profile-routing.module';

import { ProfileComponent } from './profile.component';

import { NgQrScannerModule } from 'angular2-qrscanner';

import { QRCodeModule } from 'angularx-qrcode';

import { FormsModule } from '@angular/forms';
@NgModule({
    imports: [
        CommonModule,
        ProfileRoutingModule,
        FormsModule,
        QRCodeModule,
        NgQrScannerModule
    ],
    declarations: [
      ProfileComponent
    ]
})
export class ProfileModule { }
