import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '../services/api.service';
import { tap } from 'rxjs/operators';
import { Customer } from '../models/customer';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private customers$: BehaviorSubject<Customer[]> = new BehaviorSubject([] as Customer[]);
  public readonly onCustomersChanged: Observable<Customer[]> = this.customers$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll() : Observable<Customer[]> {
    return this.apiService.get('/customers').pipe(
      tap(data => this.customers$.next(data))
    );
  }


  disableAccount() : Observable<Customer[]> {
    return this.apiService.get('/customers').pipe(
      tap(data => this.customers$.next(data))
    );
  }

  getCustomers(): Customer[] {
    return this.customers$.getValue();
  }

  find(id: number) : Observable<Customer> {
    return this.apiService.get(`/customers/${id}`);
  }

  edit(body, customerId: number) : Observable<Customer> {
    return this.apiService.post(`/customers/${customerId}`, body);
  }

  becomeAmbassador(id, promote: boolean) : Observable<Customer> {
    return this.apiService.put(`/becomeAmbassador/${id}/${promote ? 1 : 0}`);
  }
}
