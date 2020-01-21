

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Facilitie } from "@app/@core/models/facilitie";
import {FacilitieService} from "@app/@core/http/facilitie.service";
@Injectable({
  providedIn: "root"
})
export class FacilitieResolverService implements Resolve<Facilitie[]> {
  constructor(private facilitieService: FacilitieService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Facilitie[]> | Observable<never> {
    return this.facilitieService.findAll();
  }
}


 