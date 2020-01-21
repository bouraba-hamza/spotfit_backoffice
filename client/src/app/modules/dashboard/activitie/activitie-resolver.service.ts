

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Activitie } from "@app/@core/models/activitie";
import {ActivitieService} from "@app/@core/http/activitie.service";
@Injectable({
  providedIn: "root"
})
export class ActivitieResolverService implements Resolve<Activitie[]> {
  constructor(private activitieService: ActivitieService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Activitie[]> | Observable<never> {
    return this.activitieService.findAll();
  }
}


 