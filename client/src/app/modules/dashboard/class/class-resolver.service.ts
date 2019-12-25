import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Class } from "@app/@core/models/class";
import {ClassService} from "@app/@core/http/class.service";

@Injectable({
  providedIn: "root"
})
export class ClassResolverService implements Resolve<Class[]> {
  constructor(private classService: ClassService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Class[]> | Observable<never> {
    return this.classService.findAll();
  }
}
