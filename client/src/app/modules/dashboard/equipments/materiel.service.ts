
import { Injectable } from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators' ;
import { Materiel } from './materiel';


@Injectable()
export class MaterielService {

        private ApiUrl = 'http://localhost:8000/api/equipements';  // URL to web api
      //  private ApiUrlCostumer = 'http://localhost:8081/api/costumer';
        private row: any;

        constructor(private http: HttpClient) {

        }


        getMateriels (): Observable<Materiel[]> {
            return this.http.get<Materiel[]>(this.ApiUrl);
        }


        updateMateriel (materiel: Materiel): Observable<Materiel> {
          console.log('materielService -> updateMateriel -> materiel');
          console.log(materiel);
 
          return this.http.post<Materiel>(this.ApiUrl + '/update', materiel).pipe(
                tap((materiel: Materiel) =>{ this.log(`update Materiel w/ id=${materiel.id}`)}),
                catchError(this.handleError<Materiel>('updateProvider'))
            );
 
        }



        addMateriel(materiel: Materiel): Observable<Materiel> {
            console.log('materielService -> addMateriel -> materiel');
            console.log(materiel);

            return this.http.post<Materiel>(this.ApiUrl, materiel).pipe(
                tap((materiel: Materiel) => this.log(`added Materiel w/ id=${materiel.id}`)),
                catchError(this.handleError<Materiel>('addMateriel'))
            );
        }


        deleteMateriel (materiel:Materiel | number) : Observable<Materiel> {
          const id = typeof materiel === 'number' ? materiel : materiel.id;
            const url = `${this.ApiUrl}/del/${id},`;
            return this.http.delete<Materiel>(url).pipe(
                tap((materiel: Materiel) => this.log(`deleted Materiel w/ id=${materiel.id}`)),
                catchError(this.handleError<Materiel>('deletedMateriel'))
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

