import {EventEmitter, Injectable} from "@angular/core";
import {environment} from "../../../environments/environment";
import {HttpClient, HttpErrorResponse, HttpParams} from "@angular/common/http";
import {Observable, throwError} from "rxjs";
import {catchError} from "rxjs/operators";

@Injectable({
    providedIn: 'root'
})
export class ApiService {
    httpErrors: EventEmitter<HttpErrorResponse> = new EventEmitter<HttpErrorResponse>();

    constructor(private http: HttpClient) {}

    formatErrors = (error: HttpErrorResponse) => {
        this.httpErrors.emit(error);
        return throwError(error.error);
    }


    get(path: string, params: HttpParams = new HttpParams()): Observable<any> {
        return this.http
            .get(`${environment.api_url}${path}`, {params})
            .pipe(catchError(this.formatErrors));
    }

    put(path: string, body: Object = {}): Observable<any> {
        return this.http
            .put(`${environment.api_url}${path}`, body)
            .pipe(catchError(this.formatErrors));
    }

    post(path: string, body: Object = {}): Observable<any> {
        return this.http
            .post(`${environment.api_url}${path}`, body)
            .pipe(catchError(this.formatErrors));
    }

    delete(path): Observable<any> {
        return this.http
            .delete(`${environment.api_url}${path}`)
            .pipe(catchError(this.formatErrors));
    }
}
