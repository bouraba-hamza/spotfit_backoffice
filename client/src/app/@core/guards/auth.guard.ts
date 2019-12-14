import { Injectable } from "@angular/core";
import {
  ActivatedRouteSnapshot,
  CanActivate,
  Router,
  RouterStateSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";

import { UserService } from "../http/user.service";
import { take, map, concatMap, tap } from "rxjs/operators";
import { AuthService } from "../services/auth.service";
import { JwtService } from "../services/jwt.service";

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private router: Router,
    private authService: AuthService,
    private jwtService: JwtService
  ) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean> | Promise<boolean> | boolean {

    return this.authService.isAuthenticated.pipe(take(1), tap(isAuthenticated => {
      if(!isAuthenticated)
        this.router.navigateByUrl('/login');
        return isAuthenticated;
    }));
  }
}
