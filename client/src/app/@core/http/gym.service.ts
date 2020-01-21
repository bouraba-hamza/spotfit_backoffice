import {Injectable} from '@angular/core';
import {BehaviorSubject, Observable} from 'rxjs';
import {ApiService} from '@app/@core/services/api.service';
import {tap} from 'rxjs/operators';
import {Gym} from '@app/@core/models/gym';
import {Base64ToPng} from '@app/@core/models/base64ToPng';

@Injectable({
    providedIn: 'root'
})
export class GymService {

    private gym$: BehaviorSubject<Gym[]> = new BehaviorSubject([] as Gym[]);
    public readonly onGymChanged: Observable<Gym[]> = this.gym$.asObservable();

    private _types: BehaviorSubject<any[]> = new BehaviorSubject([]);
    public readonly types: Observable<any[]> = this._types.asObservable();

    private _passes: BehaviorSubject<any[]> = new BehaviorSubject([]);
    public readonly passes: Observable<any[]> = this._passes.asObservable();

    constructor(
        private apiService: ApiService
    ) {
    }

    findAll(): Observable<Gym[]> {
        return this.apiService.get('/gym').pipe(
            tap(data => this.gym$.next(data))
        );
    }


    getType(): any {
        return this.apiService.get('/subtype').pipe(tap((types: any[]) => this._types.next(types)));

    }

    getPass(): Observable<any> {
        return this.apiService.get('/pass').pipe(tap((passes: any[]) => this._passes.next(passes) ));
    }

    getGym(): Observable<Gym> {
        return this.apiService.post(`/gym/`);
    }

    getGyms(): Observable<Gym> {
        return this.apiService.post(`/gym/`);
    }


    find(id: number): Observable<Gym> {
        return this.apiService.get(`/gym/${id}`);
    }

    add(body): Observable<Gym> {
        return this.apiService.post(`/gym/`, body);
    }

    edit(body, gymId: number): Observable<Gym> {
        return this.apiService.post(`/gym/${gymId}`, body);
    }

    delete(id: number): Observable<Gym> {
        return this.apiService.put(`/gym/${id}`);
    }


}


