import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Partner } from "@app/@core/models/partner";
import { PartnerService } from "@app/@core/http/partner.service";

@Injectable({
  providedIn: "root"
})
export class PartnerResolverService implements Resolve<Partner[]> {
  constructor(private partnerService: PartnerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Partner[]> | Observable<never> {
    return this.partnerService.findAll();
  }
}
