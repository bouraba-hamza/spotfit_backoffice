import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable, BehaviorSubject, ReplaySubject } from "rxjs";

import { ApiService } from "./api.service";
import { JwtService } from "./jwt.service";
import { map, distinctUntilChanged } from "rxjs/operators";
import { Router } from '@angular/router';

@Injectable({
  providedIn: "root" 
})
export class AuthService {
  private currentUserSubject = new BehaviorSubject<any>({} as any);
  public currentUser = this.currentUserSubject
    .asObservable()
    .pipe(distinctUntilChanged());

  private isAuthenticatedSubject = new ReplaySubject<boolean>(1);
  public isAuthenticated = this.isAuthenticatedSubject.asObservable();

  constructor(
    private apiService: ApiService,
    private http: HttpClient,
    private jwtService: JwtService,
    private router: Router,
  ) {}

  // Verify JWT in localstorage with server & load user's info.
  // This runs once on application startup.
  populate() {
    // If JWT detected, attempt to get & store user's info
    if (this.jwtService.getToken()) {
      this.apiService.get("/me").subscribe(
        data => this.setAuth(data),
        err => this.purgeAuth()
      );
    } else {
      // Remove any potential remnants of previous auth states
      this.purgeAuth();
    }
  }

  update(user: any) {
    // Set current user data into observable
    this.currentUserSubject.next(user);
  }

  setAuth(user: any) {
    // Save JWT sent from server in localstorage
    this.jwtService.saveToken(user.jwtToken.access_token);
    // Set current user data into observable
    this.currentUserSubject.next(user);
    // Set isAuthenticated to true
    this.isAuthenticatedSubject.next(true);
    // navigate the protected area
    this.router.navigateByUrl("/dashboard");
  }

  purgeAuth() {
    // Remove JWT from localstorage
    this.jwtService.destroyToken();
    // Set current user to an empty object
    this.currentUserSubject.next({} as any);
    // Set auth status to false
    this.isAuthenticatedSubject.next(false);
  }

  attemptAuth(credentials): Observable<any> {
    return this.apiService.post("/login", credentials).pipe(
      map(data => {
        if(data.jwtToken != undefined)
          this.setAuth(data);
        return data;
      })
    );
  }

  getCurrentUser(): any {
    return this.currentUserSubject.value;
  }

  logout() {
    return this.apiService.post("/logout").pipe(
      map(data => {
        this.purgeAuth();
        this.router.navigateByUrl("/login");
      })
    );
  }
}
