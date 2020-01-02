import {Injectable} from '@angular/core';
import {BehaviorSubject, Observable} from 'rxjs';
import {ApiService} from '../services/api.service';
import {tap} from 'rxjs/operators';
import {Receptionist} from '../models/receptionist';

@Injectable({
    providedIn: 'root'
})
export class ReceptionistService {

    private receptionists$: BehaviorSubject<Receptionist[]> = new BehaviorSubject([] as Receptionist[]);
    public readonly onReceptionistsChanged: Observable<Receptionist[]> = this.receptionists$.asObservable();

    constructor(
        private apiService: ApiService
    ) {
    }

    findAll(): Observable<Receptionist[]> {
        return this.apiService.get('/receptionists').pipe(
            tap(data => this.receptionists$.next(data))
        );
    }


    disableAccount(): Observable<Receptionist[]> {
        return this.apiService.get('/receptionists').pipe(
            tap(data => this.receptionists$.next(data))
        );
    }

    getReceptionists(): Receptionist[] {
        return this.receptionists$.getValue();
    }

    find(id: number): Observable<Receptionist> {
        return this.apiService.get(`/receptionists/${id}`);
    }

    add(body): Observable<Receptionist> {
        return this.apiService.post(`/receptionists/`, body);
    }

    edit(body, receptionistId: number): Observable<Receptionist> {
        return this.apiService.post(`/receptionists/${receptionistId}`, body);
    }
}
