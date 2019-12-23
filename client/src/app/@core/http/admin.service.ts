import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import { Admin } from '../models/admin';
import { HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  private admins$: BehaviorSubject<Admin[]> = new BehaviorSubject([] as Admin[]);
  public readonly onAdminsChanged: Observable<Admin[]> = this.admins$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Admin[]> {
    return this.apiService.get('/admins').pipe(
      tap(data => this.admins$.next(data))
    );
  }


  disableAccount() : Observable<Admin[]> {
    return this.apiService.get('/admins').pipe(
      tap(data => this.admins$.next(data))
    );
  }

  getAdmins(): Admin[] {
    return this.admins$.getValue();
  }

  find(id: number) : Observable<Admin> {
    return this.apiService.get(`/admins/${id}`);
  }

  add(body) : Observable<Admin> {
    return this.apiService.post(`/admins/`, body);
  }

  edit(body, adminId: number) : Observable<Admin> {
    return this.apiService.post(`/admins/${adminId}`, body);
  }
}
