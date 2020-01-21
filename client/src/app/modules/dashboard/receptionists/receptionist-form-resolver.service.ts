import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Receptionist } from "@app/@core/models/receptionist";
import { ReceptionistService } from "@app/@core/http/receptionist.service";


@Injectable({
  providedIn: 'root'
})
export class ReceptionistFormResolverService implements Resolve<Receptionist> {
  constructor(private receptionistService: ReceptionistService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Receptionist> | Observable<never> {

    let receptionistId: any = route.queryParamMap.get("receptionistId");
    let action = route.queryParamMap.get("action");
    if (action == 'add') {
      return of(null);
    } else {
      return this.receptionistService.find(receptionistId);
    }
  }
}
