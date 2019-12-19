import {Injectable} from '@angular/core';
import {
    HttpClient,
    HttpErrorResponse,
    HttpEvent,
    HttpHandler,
    HttpHeaders,
    HttpInterceptor,
    HttpRequest
} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';

import {JwtService} from '../services/jwt.service';
import {catchError, map, share} from "rxjs/operators";
import {AuthService} from "@app/@core/services/auth.service";

@Injectable()
export class HttpTokenInterceptor implements HttpInterceptor {
    constructor(private jwtService: JwtService, private http: HttpClient, private authService: AuthService) {
    }

    intercept(
        req: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        const headersConfig = {
            // 'Content-Type': 'application/json',
            'Accept': 'application/json'
        };

        const token: string = this.jwtService.getToken();

        const request = this.addToken(req, token);
        return next.handle(request);
    }


    addToken(req: HttpRequest<any>, token: string): HttpRequest<any> {
        return req.clone({setHeaders: {'Authorization': `Bearer ${token}`}})
    }
}
