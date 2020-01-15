

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Facture } from "@app/@core/models/facture";
import {FactureService} from "@app/@core/http/facture.service";
@Injectable({
  providedIn: "root"
})
export class FactureResolverService implements Resolve<Facture[]> {
  constructor(private factureService: FactureService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Facture[]> | Observable<never> {
    return this.factureService.findAll();
  }
}


 