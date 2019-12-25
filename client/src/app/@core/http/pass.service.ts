import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import {Pass} from "@app/@core/models/pass";

@Injectable({
  providedIn: 'root'
})
export class PassService {

  private pass$: BehaviorSubject<Pass[]> = new BehaviorSubject([] as Pass[]);
  public readonly onPassChanged: Observable<Pass[]> = this.pass$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Pass[]> {
    return this.apiService.get('/pass').pipe(
      tap(data => this.pass$.next(data))
    );
  }


  getPass(): Pass[] {
    return this.pass$.getValue();
  }

  find(id: number) : Observable<Pass> {
    return this.apiService.get(`/pass/${id}`);
  }

  add(body) : Observable<Pass> {
    return this.apiService.post(`/pass/`, body);
  }

  edit(body, passId: number) : Observable<Pass> {
    return this.apiService.post(`/pass/${passId}`, body);
  }
}
