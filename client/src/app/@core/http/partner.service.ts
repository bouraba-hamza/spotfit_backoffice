import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import { Partner } from '../models/partner';

@Injectable({
  providedIn: 'root'
})
export class PartnerService {

  private partners$: BehaviorSubject<Partner[]> = new BehaviorSubject([] as Partner[]);
  public readonly onPartnersChanged: Observable<Partner[]> = this.partners$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Partner[]> {
    return this.apiService.get('/partners').pipe(
      tap(data => this.partners$.next(data))
    );
  }


  disableAccount() : Observable<Partner[]> {
    return this.apiService.get('/partners').pipe(
      tap(data => this.partners$.next(data))
    );
  }

  getPartners(): Partner[] {
    return this.partners$.getValue();
  }

  find(id: number) : Observable<Partner> {
    return this.apiService.get(`/partners/${id}`);
  }

  add(body) : Observable<Partner> {
    return this.apiService.post(`/partners/`, body);
  }

  edit(body, partnerId: number) : Observable<Partner> {
    return this.apiService.post(`/partners/${partnerId}`, body);
  }
}
