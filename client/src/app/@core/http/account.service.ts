import { Injectable } from '@angular/core';
import { ApiService } from '../services/api.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(private apiService: ApiService) { }

  disable(accountId: number): Observable<any> {
    return this.apiService.put(`/accounts/${accountId}/disable`);
  }

  enable(accountId: number): Observable<any> {
    return this.apiService.put(`/accounts/${accountId}/enable`);
  }
}
