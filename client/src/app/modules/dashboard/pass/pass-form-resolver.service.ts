import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Pass } from "@app/@core/models/pass";
import { PassService } from "@app/@core/http/pass.service";


@Injectable({
  providedIn: 'root'
})
export class PassFormResolverService implements Resolve<Pass> {
  constructor(private passService: PassService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Pass> | Observable<never> {

    let passId: any = route.queryParamMap.get("passId");
    let action = route.queryParamMap.get("action");
    console.log({passId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.passService.find(passId);
    }
  }
}
