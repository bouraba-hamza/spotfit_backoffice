

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Gym } from "@app/@core/models/gym";
import {GymService} from "@app/@core/http/gym.service";
@Injectable({
  providedIn: "root"
})
export class GymResolverService implements Resolve<Gym[]> {
  constructor(private gymService: GymService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Gym[]> | Observable<never> {
    return this.gymService.findAll();
  }
}


 