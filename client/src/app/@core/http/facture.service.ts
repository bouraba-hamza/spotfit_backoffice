
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Facture} from '@app/@core/models/facture';

@Injectable({
  providedIn: 'root'
})
export class FactureService {

  private facture$: BehaviorSubject<Facture[]> = new BehaviorSubject([] as Facture[]);
  public readonly onFactureChanged: Observable<Facture[]> = this.facture$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Facture[]> {
    return this.apiService.get('/facture').pipe(
      tap(data => this.facture$.next(data))
    );
  }



  getFacture(): Facture[] {
    return this.facture$.getValue();
  }

  find(id: number) : Observable<Facture> {
    return this.apiService.get(`/facture/${id}`);
  }

  add(body) : Observable<Facture> {
    return this.apiService.post(`/facture/`, body);
  }

  edit(body, factureId: number) : Observable<Facture> {
    return this.apiService.post(`/facture/${factureId}`, body);
  }

  delete(id: number) : Observable<Facture> {
    return this.apiService.put(`/facture/${id}`);
  }

}


 