import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {SubscriptionCollectionComponent} from "@app/modules/spotfit/pages/subscription-collection/subscription-collection.component";
import {GymDetailComponent} from "@app/modules/spotfit/pages/gym-detail/gym-detail.component";

const routes: Routes = [
  { path: '', redirectTo: 'gym-detail' },
  { path: 'subscriptions', component: SubscriptionCollectionComponent },
  { path: 'gym-detail', component: GymDetailComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SpotfitRoutingModule { }
