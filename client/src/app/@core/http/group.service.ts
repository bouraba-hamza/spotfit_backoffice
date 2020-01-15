
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Group} from '@app/@core/models/group';

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  private group$: BehaviorSubject<Group[]> = new BehaviorSubject([] as Group[]);
  public readonly onGroupChanged: Observable<Group[]> = this.group$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Group[]> {
    return this.apiService.get('/group').pipe(
      tap(data => this.group$.next(data))
    );
  }



  getGroup(): Group[] {
    return this.group$.getValue();
  }

  find(id: number) : Observable<Group> {
    return this.apiService.get(`/group/${id}`);
  }

  add(body) : Observable<Group> {
    return this.apiService.post(`/group/`, body);
  }

  edit(body, groupId: number) : Observable<Group> {
    return this.apiService.post(`/group/${groupId}`, body);
  }

  delete(id: number) : Observable<Group> {
    return this.apiService.put(`/group/${id}`);
  }

}


 