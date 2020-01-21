

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Facture } from "@app/@core/models/facture";
import { FactureService } from "@app/@core/http/facture.service";


@Injectable({
  providedIn: 'root'
})
export class FactureFormResolverService implements Resolve<Facture> {
  constructor(private factureService: FactureService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Facture> | Observable<never> {

    let factureId: any = route.queryParamMap.get("factureId");
    let action = route.queryParamMap.get("action");
    console.log({factureId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.factureService.find(factureId);
    }
  }
}


 