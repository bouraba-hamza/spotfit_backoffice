import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Customer } from "@app/@core/models/customer";
import { CustomerService } from "@app/@core/http/customer.service";

@Injectable({
  providedIn: "root"
})
export class CustomerResolverService implements Resolve<Customer[]> {
  constructor(private customerService: CustomerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Customer[]> | Observable<never> {
    return this.customerService.findAll();
  }
}
