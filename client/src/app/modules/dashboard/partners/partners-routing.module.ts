import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { PartnerListComponent } from "./partner-list/partner-list.component";
import { PartnerResolverService } from './partner-resolver.service';
import { PartnerFormComponent } from './partner-form/partner-form.component';
import { PartnerFormResolverService } from './partner-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: PartnerListComponent,
    resolve: {
      partners: PartnerResolverService
    }
  },
  {
    path: "form",
    component: PartnerFormComponent,
    resolve: {
      partner: PartnerFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PartnersRoutingModule {}
