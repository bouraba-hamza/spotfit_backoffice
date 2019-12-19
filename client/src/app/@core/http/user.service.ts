import { Injectable } from "@angular/core";
import { Observable } from "rxjs";

import { ApiService } from "../services/api.service";
import { map } from "rxjs/operators";
import { AuthService } from "../services/auth.service";

@Injectable()
export class UserService {
  constructor(
    private apiService: ApiService,
    private authService: AuthService
  ) {}

  // Update the user on the server (email, pass, etc)
  update(user): Observable<any> {
    return this.apiService.put("/user", { user }).pipe(
      map(data => {
        // Update the currentUser observable
        this.authService.update(data.user);
        return data.user;
      })
    );
  }
}
