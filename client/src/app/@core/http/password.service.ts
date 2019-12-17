import { Injectable } from '@angular/core';
import {ApiService} from "@app/@core/services/api.service";

@Injectable({
  providedIn: 'root'
})
export class PasswordService {

  constructor(
      private apiService: ApiService
  ) { }

  resetPassword(email: string) {
    return this.apiService.post('/reset-password', { email });
  }

  verifyTicket(ticket: string) {
    return this.apiService.get(`/password/${ticket}/verify`);
  }

  update(data: {password, ticket}) {
    return this.apiService.post('/password/update', data);
  }
}
