import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Admin } from "@app/@core/models/admin";
import { AdminService } from "@app/@core/http/admin.service";


@Injectable({
  providedIn: 'root'
})
export class AdminFormResolverService implements Resolve<Admin> {
  constructor(private adminService: AdminService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Admin> | Observable<never> {

    let adminId: any = route.queryParamMap.get("adminId");
    let action = route.queryParamMap.get("action");
    if (action == 'add') {
      return of(null);
    } else {
      return this.adminService.find(adminId);
    }
  }
}
