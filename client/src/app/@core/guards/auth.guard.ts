import { Injectable } from "@angular/core";
import {
  ActivatedRouteSnapshot,
  CanActivate,
  Router,
  RouterStateSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";

import { UserService } from "../http/user.service";
import { take, map, concatMap } from "rxjs/operators";
import { AuthService } from "../services/auth.service";

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private authService: AuthService) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean> {
    return this.authService.isAuthenticated.pipe(
      take(1),
      concatMap(authenticated => {
        if (!authenticated) {
          this.router.navigateByUrl("/login");
          return of(null);
        }
      })
    );
  }
}
