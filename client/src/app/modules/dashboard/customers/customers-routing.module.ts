import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { CustomerListComponent } from "./customer-list/customer-list.component";
import { CustomerResolverService } from './customer-resolver.service';
import { CustomerFormComponent } from './customer-form/customer-form.component';
import { CustomerFormResolverService } from './customer-form-resolver.service';

const routes: Routes = [
  {
    path: "",
    component: CustomerListComponent,
    resolve: {
      customers: CustomerResolverService
    }
  },
  {
    path: "form",
    component: CustomerFormComponent,
    resolve: {
      customer: CustomerFormResolverService
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CustomersRoutingModule {}
