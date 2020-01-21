import {Injectable} from '@angular/core';
import {BehaviorSubject, Observable} from 'rxjs';
import {ApiService} from '../services/api.service';
import {tap} from 'rxjs/operators';
import {Supervisor} from '../models/supervisor';

@Injectable({
    providedIn: 'root'
})
export class SupervisorService {

    private supervisors$: BehaviorSubject<Supervisor[]> = new BehaviorSubject([] as Supervisor[]);
    public readonly onSupervisorsChanged: Observable<Supervisor[]> = this.supervisors$.asObservable();

    constructor(
        private apiService: ApiService
    ) {
    }

    findAll(): Observable<Supervisor[]> {
        return this.apiService.get('/supervisors').pipe(
            tap(data => this.supervisors$.next(data))
        );
    }


    disableAccount(): Observable<Supervisor[]> {
        return this.apiService.get('/supervisors').pipe(
            tap(data => this.supervisors$.next(data))
        );
    }

    getSupervisors(): Supervisor[] {
        return this.supervisors$.getValue();
    }

    find(id: number): Observable<Supervisor> {
        return this.apiService.get(`/supervisors/${id}`);
    }

    add(body): Observable<Supervisor> {
        return this.apiService.post(`/supervisors/`, body);
    }

    edit(body, supervisorId: number): Observable<Supervisor> {
        return this.apiService.post(`/supervisors/${supervisorId}`, body);
    }
}
