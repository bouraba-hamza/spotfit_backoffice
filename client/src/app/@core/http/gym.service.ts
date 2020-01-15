
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Gym} from '@app/@core/models/gym';
import {Base64ToPng} from '@app/@core/models/base64ToPng';

@Injectable({
  providedIn: 'root'
})
export class GymService {

  private gym$: BehaviorSubject<Gym[]> = new BehaviorSubject([] as Gym[]);
  public readonly onGymChanged: Observable<Gym[]> = this.gym$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Gym[]> {
    return this.apiService.get('/gym').pipe(
      tap(data => this.gym$.next(data))
    );
  }



  getGym(): Gym[] {
    return this.gym$.getValue();
  }

  find(id: number) : Observable<Gym> {
    return this.apiService.get(`/gym/${id}`);
  }

  add(body) : Observable<Gym> {
    return this.apiService.post(`/gym/`, body);
  }

  edit(body, gymId: number) : Observable<Gym> {
    return this.apiService.post(`/gym/${gymId}`, body);
  }

  delete(id: number) : Observable<Gym> {
    return this.apiService.put(`/gym/${id}`);
  }



}


