import { Injectable } from "@angular/core";
import {
  Router,
  Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot
} from "@angular/router";
import { Observable } from "rxjs";
import { Setting } from "@app/@core/models/setting";
import { SettingService } from "@app/@core/http/setting.service";


@Injectable({
  providedIn: 'root'
})
export class SettingsResolverService implements Resolve<Setting[]> {
  constructor(private settingService: SettingService, private router: Router) {}

  resolve( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<Setting[]> | Observable<never> {
      return this.settingService.all();
  }
}