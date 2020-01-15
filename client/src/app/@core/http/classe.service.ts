
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Classe} from '@app/@core/models/classe';

@Injectable({
  providedIn: 'root'
})
export class ClasseService {

  private classe$: BehaviorSubject<Classe[]> = new BehaviorSubject([] as Classe[]);
  public readonly onClasseChanged: Observable<Classe[]> = this.classe$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Classe[]> {
    return this.apiService.get('/classe').pipe(
      tap(data => this.classe$.next(data))
    );
  }



  getClasse(): Classe[] {
    return this.classe$.getValue();
  }

  find(id: number) : Observable<Classe> {
    return this.apiService.get(`/classe/${id}`);
  }

  add(body) : Observable<Classe> {
    return this.apiService.post(`/classe/`, body);
  }

  edit(body, classeId: number) : Observable<Classe> {
    return this.apiService.post(`/classe/${classeId}`, body);
  }

  delete(id: number) : Observable<Classe> {
    return this.apiService.put(`/classe/${id}`);
  }

}


 