
import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';
import { Gym } from './gym';


@Injectable()
export class GymService {

        private ApiUrl = 'http://localhost:8000/api/gyms';  // URL to web api
        private row: any;
        constructor(private http: HttpClient) {
        }

        getGyms (): Observable<Gym[]> {
            return this.http.get<Gym[]>(this.ApiUrl);
        }


      //  getCostumers (): Observable<Costumer[]> {
     //       return this.http.get<Costumer[]>(this.ApiUrlCostumer);
     //   }

        addGym(gym: Gym): Observable<Gym> {
            return this.http.post<Gym>(this.ApiUrl + '/add', gym).pipe(
                tap((gym: Gym) => this.log(`added Gym w/ id=${gym.id}`)),
                catchError(this.handleError<Gym>('add Gym'))
            );
        }

        deleteGym (gym: Gym | number): Observable<Gym> {
          const id = typeof gym === 'number' ? gym : gym.id;
            const url = `${this.ApiUrl}/del/${id},`;

            return this.http.delete<Gym>(url).pipe(
                tap((gym: Gym) => this.log(`deleted Gym w/ id=${gym.id}`)),
                catchError(this.handleError<Gym>('deleted Gym'))
            );
        }


        updateGym (gym: Gym): Observable<Gym> {
          return this.http.post<Gym>(this.ApiUrl+'/update', gym).pipe(
                tap((gym: Gym) =>{console.log(gym); this.log(`update Gym w/ id=${gym.id}`)}),
                catchError(this.handleError<Gym>('updateProvider'))
            );

        }


        private handleError<T> (operation = 'operation', result?: T) {
            return (error: any): Observable<T> => {

                // TODO: send the error to remote logging infrastructure
                // console.error(error); // log to console instead

                // TODO: better job of transforming error for user consumption
                this.log(`${operation} failed: ${error.message}`);

                // Let the app keep running by returning an empty result.
                return of(result as T);
            };
        }

        /** Log a HeroService message with the MessageService */
        private log(message: string) {
            console.log(message);
        }




}

