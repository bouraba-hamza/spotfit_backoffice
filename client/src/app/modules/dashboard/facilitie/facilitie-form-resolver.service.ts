

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Facilitie } from "@app/@core/models/facilitie";
import { FacilitieService } from "@app/@core/http/facilitie.service";


@Injectable({
  providedIn: 'root'
})
export class FacilitieFormResolverService implements Resolve<Facilitie> {
  constructor(private facilitieService: FacilitieService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Facilitie> | Observable<never> {

    let facilitieId: any = route.queryParamMap.get("facilitieId");
    let action = route.queryParamMap.get("action");
    console.log({facilitieId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.facilitieService.find(facilitieId);
    }
  }
}


 