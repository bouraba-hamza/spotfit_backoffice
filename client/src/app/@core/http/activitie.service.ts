
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Activitie} from '@app/@core/models/activitie';

@Injectable({
  providedIn: 'root'
})
export class ActivitieService {

  private activitie$: BehaviorSubject<Activitie[]> = new BehaviorSubject([] as Activitie[]);
  public readonly onActivitieChanged: Observable<Activitie[]> = this.activitie$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Activitie[]> {
    return this.apiService.get('/activitie').pipe(
      tap(data => this.activitie$.next(data))
    );
  }



  getActivitie(): Activitie[] {
    return this.activitie$.getValue();
  }

  find(id: number) : Observable<Activitie> {
    return this.apiService.get(`/activitie/${id}`);
  }

  add(body) : Observable<Activitie> {
    return this.apiService.post(`/activitie/`, body);
  }

  edit(body, activitieId: number) : Observable<Activitie> {
    return this.apiService.post(`/activitie/${activitieId}`, body);
  }

  delete(id: number) : Observable<Activitie> {
    return this.apiService.put(`/activitie/${id}`);
  }

}


 