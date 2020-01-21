

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Group } from "@app/@core/models/group";
import {GroupService} from "@app/@core/http/group.service";
@Injectable({
  providedIn: "root"
})
export class GroupResolverService implements Resolve<Group[]> {
  constructor(private groupService: GroupService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Group[]> | Observable<never> {
    return this.groupService.findAll();
  }
}


 