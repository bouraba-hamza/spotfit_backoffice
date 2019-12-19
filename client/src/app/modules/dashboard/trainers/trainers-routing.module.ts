import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { TrainerListComponent } from "./trainer-list/trainer-list.component";
import { TrainerResolverService } from './trainer-resolver.service';
import { TrainerFormComponent } from './trainer-form/trainer-form.component';
import { TrainerFormResolverService } from './trainer-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: TrainerListComponent,
    resolve: {
      trainers: TrainerResolverService
    }
  },
  {
    path: "form",
    component: TrainerFormComponent,
    resolve: {
      trainer: TrainerFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TrainersRoutingModule {}
