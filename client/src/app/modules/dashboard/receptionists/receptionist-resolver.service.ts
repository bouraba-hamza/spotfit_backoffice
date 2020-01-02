import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Receptionist } from "@app/@core/models/receptionist";
import { ReceptionistService } from "@app/@core/http/receptionist.service";

@Injectable({
  providedIn: "root"
})
export class ReceptionistResolverService implements Resolve<Receptionist[]> {
  constructor(private receptionistService: ReceptionistService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Receptionist[]> | Observable<never> {
    return this.receptionistService.findAll();
  }
}
