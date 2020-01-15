
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Facilitie} from '@app/@core/models/facilitie';

@Injectable({
  providedIn: 'root'
})
export class FacilitieService {

  private facilitie$: BehaviorSubject<Facilitie[]> = new BehaviorSubject([] as Facilitie[]);
  public readonly onFacilitieChanged: Observable<Facilitie[]> = this.facilitie$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Facilitie[]> {
    return this.apiService.get('/facilitie').pipe(
      tap(data => this.facilitie$.next(data))
    );
  }



  getFacilitie(): Facilitie[] {
    return this.facilitie$.getValue();
  }

  find(id: number) : Observable<Facilitie> {
    return this.apiService.get(`/facilitie/${id}`);
  }

  add(body) : Observable<Facilitie> {
    return this.apiService.post(`/facilitie/`, body);
  }

  edit(body, facilitieId: number) : Observable<Facilitie> {
    return this.apiService.post(`/facilitie/${facilitieId}`, body);
  }

  delete(id: number) : Observable<Facilitie> {
    return this.apiService.put(`/facilitie/${id}`);
  }

}


 