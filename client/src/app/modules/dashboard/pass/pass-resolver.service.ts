import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Pass } from "@app/@core/models/pass";
import {PassService} from "@app/@core/http/pass.service";
@Injectable({
  providedIn: "root"
})
export class PassResolverService implements Resolve<Pass[]> {
  constructor(private passService: PassService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Pass[]> | Observable<never> {
    return this.passService.findAll();
  }
}
