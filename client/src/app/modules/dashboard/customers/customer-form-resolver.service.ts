import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Customer } from "@app/@core/models/customer";
import { CustomerService } from "@app/@core/http/customer.service";


@Injectable({
  providedIn: 'root'
})
export class CustomerFormResolverService implements Resolve<Customer> {
  constructor(private customerService: CustomerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Customer> | Observable<never> {

    let customerId: any = route.queryParamMap.get("customerId");
    let action = route.queryParamMap.get("action");
    if (action == 'add') {
     this.router.navigateByUrl("/dashboard/customer");
      return of(null);
    } else {
      return this.customerService.find(customerId);
    }
  }
}