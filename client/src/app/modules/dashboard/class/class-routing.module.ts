import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import {ClassListComponent} from "./class-list/class-list.component";
import {ClassResolverService} from './class-resolver.service';
import {ClassFormComponent} from './class-form/class-form.component';
import {ClassFormResolverService} from './class-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: ClassListComponent,
    resolve: {
      classes: ClassResolverService
    }
  },
  {
    path: "form",
    component: ClassFormComponent,
    resolve: {
      class: ClassFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ClassRoutingModule {}
