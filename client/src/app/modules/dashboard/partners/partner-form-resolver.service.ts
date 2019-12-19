import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Partner } from "@app/@core/models/partner";
import { PartnerService } from "@app/@core/http/partner.service";


@Injectable({
  providedIn: 'root'
})
export class PartnerFormResolverService implements Resolve<Partner> {
  constructor(private partnerService: PartnerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Partner> | Observable<never> {

    let partnerId: any = route.queryParamMap.get("partnerId");
    let action = route.queryParamMap.get("action");
    console.log({partnerId, action})
    if (action == 'add') {
      return of(null);
    } else {
      return this.partnerService.find(partnerId);
    }
  }
}