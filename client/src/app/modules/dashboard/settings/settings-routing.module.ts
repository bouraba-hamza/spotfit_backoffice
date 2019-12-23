import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import {SettingsOverviewComponent} from "@app/modules/dashboard/settings/settings-overview/settings-overview.component";
import {SettingsResolverService} from "@app/modules/dashboard/settings/settings-overview/settings-resolver.service";

const routes: Routes = [
  {
    path: '**',
    component: SettingsOverviewComponent,
    resolve: {
      settings: SettingsResolverService
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SettingsRoutingModule {}
