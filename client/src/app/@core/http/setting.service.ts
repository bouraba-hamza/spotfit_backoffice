import { Injectable } from '@angular/core';
import {ApiService} from "@app/@core/services/api.service";
import {BehaviorSubject, Observable} from "rxjs";
import {Setting} from "@app/@core/models/setting";
import {Admin} from "@app/@core/models/admin";
import {tap} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class SettingService {

  private settings$: BehaviorSubject<Setting[]> = new BehaviorSubject([] as Setting[]);
  public readonly onSettingsChanged: Observable<Setting[]> = this.settings$.asObservable();

  constructor(private apiService: ApiService) { }

  update(key: string, payload: Setting): Observable<any> {
    return this.apiService.put(`/settings/${key}`, payload);
  }

  get(id): Observable<Setting> {
    return this.apiService.get(`/settings/${id}`);
  }

  all(): Observable<Setting[]> {
    return this.apiService.get('/settings').pipe(
        tap(data => this.settings$.next(data))
    );
  }
}
