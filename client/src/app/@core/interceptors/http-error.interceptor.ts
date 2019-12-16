import { Injectable, Injector } from '@angular/core';
import {
    HttpEvent,
    HttpInterceptor,
    HttpHandler,
    HttpRequest,
    HttpResponse,
    HttpErrorResponse
} from '@angular/common/http';
import {Observable, of, throwError} from 'rxjs';
import {retry, catchError, flatMap} from 'rxjs/operators';
import {AuthService} from "@app/@core/services/auth.service";

@Injectable({ providedIn: 'root' })
export class HttpErrorInterceptor implements HttpInterceptor {
    constructor(private injector: Injector, private authService: AuthService) { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(request)
            .pipe(
                retry(1),
                catchError((error: HttpErrorResponse) => {
                    let errorMessage = '';
                    if (error.error instanceof ErrorEvent) {
                        /**
                         * client-side error
                         */
                        errorMessage = `Error: ${error.error.message}`;
                    } else {
                        /**
                         * server-side error
                         */
                        errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;

                        // resolve token issues
                        if (error.status === 401 || error.status === 500 || error.status === 404) {
                            if (error.error !== undefined && error.error.errors[0] !== undefined) {
                                switch (error.error.errors[0]) {
                                    case 'EXPIRED_TOKEN':
                                        return this.authService.refresh();
                                    case 'NOT_FOUND': case 'INVALID_TOKEN':
                                        this.authService.purgeAuth();
                                        return of(null);
                                }
                            }
                        }
                    }
                    window.alert(errorMessage);
                    return throwError(errorMessage);
                })
            )
    }



    getNewRequest(req: HttpRequest<any>): HttpRequest<any> {
        // @ts-ignore
        return new HttpRequest(req.method, req.urlWithParams, );
    }
}