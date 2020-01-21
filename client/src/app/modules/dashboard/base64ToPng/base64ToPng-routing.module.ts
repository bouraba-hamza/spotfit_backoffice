

import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { Base64ToPngListComponent } from "./base64ToPng-list/base64ToPng-list.component";
import { Base64ToPngResolverService } from './base64ToPng-resolver.service';
import { Base64ToPngFormComponent } from './base64ToPng-form/base64ToPng-form.component';
import { Base64ToPngFormResolverService } from './base64ToPng-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: Base64ToPngListComponent,
    resolve: {
      base64ToPnge: Base64ToPngResolverService
    }
  },
  {
    path: "form",
    component: Base64ToPngFormComponent,
    resolve: {
      base64ToPng: Base64ToPngFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class Base64ToPngRoutingModule {}


 