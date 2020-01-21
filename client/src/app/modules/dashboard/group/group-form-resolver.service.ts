

import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import { Group } from "@app/@core/models/group";
import { GroupService } from "@app/@core/http/group.service";


@Injectable({
  providedIn: 'root'
})
export class GroupFormResolverService implements Resolve<Group> {
  constructor(private groupService: GroupService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Group> | Observable<never> {

    let groupId: any = route.queryParamMap.get("groupId");
    let action = route.queryParamMap.get("action");
    console.log({groupId, action});
    if (action == 'add') {
      return of(null);
    } else {
      return this.groupService.find(groupId);
    }
  }
}


 