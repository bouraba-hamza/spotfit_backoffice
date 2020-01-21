

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Equipement } from "@app/@core/models/equipement";
import {EquipementService} from "@app/@core/http/equipement.service";
@Injectable({
  providedIn: "root"
})
export class EquipementResolverService implements Resolve<Equipement[]> {
  constructor(private equipementService: EquipementService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Equipement[]> | Observable<never> {
    return this.equipementService.findAll();
  }
}


 