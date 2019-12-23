import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable, of } from "rxjs";
import {PasswordService} from "@app/@core/http/password.service";
import {catchError} from "rxjs/operators";


@Injectable({
  providedIn: 'root'
})
export class EditPasswordResolverService implements Resolve<boolean> {
  constructor(private passwordService: PasswordService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<boolean> {

    let ticket: any = route.paramMap.get("ticket");
    if (ticket == null && ticket == undefined) {
      this.router.navigateByUrl('/login');
      return of(false);
    } else {
      return this.passwordService.verifyTicket(ticket).pipe(
          catchError(error => {
            this.router.navigateByUrl('/login');
            return of(false);
          })
      );
    }
  }
}
