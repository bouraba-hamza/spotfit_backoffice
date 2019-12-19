import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Admin } from "@app/@core/models/admin";
import { AdminService } from "@app/@core/http/admin.service";

@Injectable({
  providedIn: "root"
})
export class AdminResolverService implements Resolve<Admin[]> {
  constructor(private adminService: AdminService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Admin[]> | Observable<never> {
    return this.adminService.findAll();
  }
}
