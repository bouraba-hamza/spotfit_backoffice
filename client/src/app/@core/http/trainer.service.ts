import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import { Trainer } from '../models/trainer';

@Injectable({
  providedIn: 'root'
})
export class TrainerService {

  private trainers$: BehaviorSubject<Trainer[]> = new BehaviorSubject([] as Trainer[]);
  public readonly onTrainersChanged: Observable<Trainer[]> = this.trainers$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Trainer[]> {
    return this.apiService.get('/trainers').pipe(
      tap(data => this.trainers$.next(data))
    );
  }


  disableAccount() : Observable<Trainer[]> {
    return this.apiService.get('/trainers').pipe(
      tap(data => this.trainers$.next(data))
    );
  }

  getTrainers(): Trainer[] {
    return this.trainers$.getValue();
  }

  find(id: number) : Observable<Trainer> {
    return this.apiService.get(`/trainers/${id}`);
  }

  add(body) : Observable<Trainer> {
    return this.apiService.post(`/trainers/`, body);
  }

  edit(body, trainerId: number) : Observable<Trainer> {
    return this.apiService.post(`/trainers/${trainerId}`, body);
  }
}
