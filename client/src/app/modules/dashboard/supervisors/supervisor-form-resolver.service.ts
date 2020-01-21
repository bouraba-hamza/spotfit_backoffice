import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Supervisor } from "@app/@core/models/supervisor";
import { SupervisorService } from "@app/@core/http/supervisor.service";


@Injectable({
  providedIn: 'root'
})
export class SupervisorFormResolverService implements Resolve<Supervisor> {
  constructor(private supervisorService: SupervisorService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Supervisor> | Observable<never> {

    let supervisorId: any = route.queryParamMap.get("supervisorId");
    let action = route.queryParamMap.get("action");
    if (action == 'add') {
      return of(null);
    } else {
      return this.supervisorService.find(supervisorId);
    }
  }
}
