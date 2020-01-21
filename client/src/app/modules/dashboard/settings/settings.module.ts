import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SettingsOverviewComponent } from './settings-overview/settings-overview.component';
import {SettingsRoutingModule} from "@app/modules/dashboard/settings/settings-routing.module";
import {SharedModule} from "@app/shared/shared.module";


@NgModule({
  declarations: [SettingsOverviewComponent],
  imports: [
    CommonModule,
      SettingsRoutingModule,
      SharedModule
  ]
})
export class SettingsModule { }
