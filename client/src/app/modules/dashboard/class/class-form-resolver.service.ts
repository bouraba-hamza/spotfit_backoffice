import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Class } from "@app/@core/models/class";
import { ClassService } from "@app/@core/http/class.service";


@Injectable({
  providedIn: 'root'
})
export class ClassFormResolverService implements Resolve<Class> {
  constructor(private classService: ClassService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Class> | Observable<never> {

    let ClassId: any = route.queryParamMap.get("classId");
    let action = route.queryParamMap.get("action");
    console.log({ClassId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.classService.find(ClassId);
    }
  }
}
