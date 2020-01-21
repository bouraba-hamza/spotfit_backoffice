

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Equipement } from "@app/@core/models/equipement";
import { EquipementService } from "@app/@core/http/equipement.service";


@Injectable({
  providedIn: 'root'
})
export class EquipementFormResolverService implements Resolve<Equipement> {
  constructor(private equipementService: EquipementService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Equipement> | Observable<never> {

    let equipementId: any = route.queryParamMap.get("equipementId");
    let action = route.queryParamMap.get("action");
    console.log({equipementId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.equipementService.find(equipementId);
    }
  }
}


 