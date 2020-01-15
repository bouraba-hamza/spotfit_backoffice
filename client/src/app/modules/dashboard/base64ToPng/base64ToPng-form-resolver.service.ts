

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Base64ToPng } from "@app/@core/models/base64ToPng";
import { Base64ToPngService } from "@app/@core/http/base64ToPng.service";


@Injectable({
  providedIn: 'root'
})
export class Base64ToPngFormResolverService implements Resolve<Base64ToPng> {
  constructor(private base64ToPngService: Base64ToPngService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Base64ToPng> | Observable<never> {

    let base64ToPngId: any = route.queryParamMap.get("base64ToPngId");
    let action = route.queryParamMap.get("action");
    console.log({base64ToPngId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.base64ToPngService.find(base64ToPngId);
    }
  }
}


 