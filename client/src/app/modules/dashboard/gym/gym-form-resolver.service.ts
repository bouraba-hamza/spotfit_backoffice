

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Gym } from "@app/@core/models/gym";
import { GymService } from "@app/@core/http/gym.service";


@Injectable({
  providedIn: 'root'
})
export class GymFormResolverService implements Resolve<Gym> {
  constructor(private gymService: GymService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Gym> | Observable<never> {

    let gymId: any = route.queryParamMap.get("gymId");
    let action = route.queryParamMap.get("action");
    console.log({gymId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.gymService.find(gymId);
    }
  }
}


 