

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Classe } from "@app/@core/models/classe";
import {ClasseService} from "@app/@core/http/classe.service";
@Injectable({
  providedIn: "root"
})
export class ClasseResolverService implements Resolve<Classe[]> {
  constructor(private classeService: ClasseService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Classe[]> | Observable<never> {
    return this.classeService.findAll();
  }
}


 