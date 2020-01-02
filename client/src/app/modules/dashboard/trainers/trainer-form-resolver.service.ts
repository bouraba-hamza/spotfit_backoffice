import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Trainer } from "@app/@core/models/trainer";
import { TrainerService } from "@app/@core/http/trainer.service";


@Injectable({
  providedIn: 'root'
})
export class TrainerFormResolverService implements Resolve<Trainer> {
  constructor(private trainerService: TrainerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Trainer> | Observable<never> {

    let trainerId: any = route.queryParamMap.get("trainerId");
    let action = route.queryParamMap.get("action");
    if (action == 'add') {
      return of(null);
    } else {
      return this.trainerService.find(trainerId);
    }
  }
}
