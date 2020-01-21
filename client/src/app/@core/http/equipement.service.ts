
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Equipement} from '@app/@core/models/equipement';

@Injectable({
  providedIn: 'root'
})
export class EquipementService {

  private equipement$: BehaviorSubject<Equipement[]> = new BehaviorSubject([] as Equipement[]);
  public readonly onEquipementChanged: Observable<Equipement[]> = this.equipement$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Equipement[]> {
    return this.apiService.get('/equipement').pipe(
      tap(data => this.equipement$.next(data))
    );
  }



  getEquipement(): Equipement[] {
    return this.equipement$.getValue();
  }

  find(id: number) : Observable<Equipement> {
    return this.apiService.get(`/equipement/${id}`);
  }

  add(body) : Observable<Equipement> {
    return this.apiService.post(`/equipement/`, body);
  }

  edit(body, equipementId: number) : Observable<Equipement> {
    return this.apiService.post(`/equipement/${equipementId}`, body);
  }

  delete(id: number) : Observable<Equipement> {
    return this.apiService.put(`/equipement/${id}`);
  }

}


 