

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Activitie } from "@app/@core/models/activitie";
import { ActivitieService } from "@app/@core/http/activitie.service";


@Injectable({
  providedIn: 'root'
})
export class ActivitieFormResolverService implements Resolve<Activitie> {
  constructor(private activitieService: ActivitieService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Activitie> | Observable<never> {

    let activitieId: any = route.queryParamMap.get("activitieId");
    let action = route.queryParamMap.get("action");
    console.log({activitieId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.activitieService.find(activitieId);
    }
  }
}


 