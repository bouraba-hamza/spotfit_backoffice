import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Trainer } from "@app/@core/models/trainer";
import { TrainerService } from "@app/@core/http/trainer.service";

@Injectable({
  providedIn: "root"
})
export class TrainerResolverService implements Resolve<Trainer[]> {
  constructor(private trainerService: TrainerService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Trainer[]> | Observable<never> {
    return this.trainerService.findAll();
  }
}
