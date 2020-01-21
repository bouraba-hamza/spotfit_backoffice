import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Supervisor } from "@app/@core/models/supervisor";
import { SupervisorService } from "@app/@core/http/supervisor.service";

@Injectable({
  providedIn: "root"
})
export class SupervisorResolverService implements Resolve<Supervisor[]> {
  constructor(private supervisorService: SupervisorService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Supervisor[]> | Observable<never> {
    return this.supervisorService.findAll();
  }
}
