
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Home} from '@app/@core/models/home';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  private home$: BehaviorSubject<Home[]> = new BehaviorSubject([] as Home[]);
  public readonly onHomeChanged: Observable<Home[]> = this.home$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Home[]> {
    return this.apiService.get('/home').pipe(
      tap(data => this.home$.next(data))
    );
  }



  getHome(): Home[] {
    return this.home$.getValue();
  }

  find(id: number) : Observable<Home> {
    return this.apiService.get(`/home/${id}`);
  }

  add(body) : Observable<Home> {
    return this.apiService.post(`/home/`, body);
  }

  edit(body, homeId: number) : Observable<Home> {
    return this.apiService.post(`/home/${homeId}`, body);
  }

  delete(id: number) : Observable<Home> {
    return this.apiService.put(`/home/${id}`);
  }

}


 