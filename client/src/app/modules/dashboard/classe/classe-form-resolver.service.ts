

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Classe } from "@app/@core/models/classe";
import { ClasseService } from "@app/@core/http/classe.service";


@Injectable({
  providedIn: 'root'
})
export class ClasseFormResolverService implements Resolve<Classe> {
  constructor(private classeService: ClasseService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Classe> | Observable<never> {

    let classeId: any = route.queryParamMap.get("classeId");
    let action = route.queryParamMap.get("action");
    console.log({classeId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.classeService.find(classeId);
    }
  }
}


 