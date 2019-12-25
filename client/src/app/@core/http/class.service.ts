import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import {Class} from "@app/@core/models/class";

@Injectable({
  providedIn: 'root'
})
export class ClassService {

  private class$: BehaviorSubject<Class[]> = new BehaviorSubject([] as Class[]);
  public readonly onClassChanged: Observable<Class[]> = this.class$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Class[]> {
    return this.apiService.get('/class').pipe(
      tap(data => this.class$.next(data))
    );
  }



  getClass(): Class[] {
    return this.class$.getValue();
  }

  find(id: number) : Observable<Class> {
    return this.apiService.get(`/class/${id}`);
  }

  add(body) : Observable<Class> {
    return this.apiService.post(`/class/`, body);
  }

  edit(body, classId: number) : Observable<Class> {
    return this.apiService.post(`/class/${classId}`, body);
  }
}
