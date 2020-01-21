
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from '@app/@core/services/api.service';
import { tap } from 'rxjs/operators';
import {Base64ToPng} from '@app/@core/models/base64ToPng';

@Injectable({
  providedIn: 'root'
})


export class Base64ToPngService {

  private base64ToPng$: BehaviorSubject<Base64ToPng[]> = new BehaviorSubject([] as Base64ToPng[]);
  public readonly onBase64ToPngChanged: Observable<Base64ToPng[]> = this.base64ToPng$.asObservable();

  constructor(
    private apiService: ApiService
  ) { }

  findAll(): Observable<Base64ToPng[]> {
    return this.apiService.get('/base64ToPng').pipe(
      tap(data => this.base64ToPng$.next(data))
    );
  }



  getBase64ToPng(): Base64ToPng[] {
    return this.base64ToPng$.getValue();
  }

  find(id: number) : Observable<Base64ToPng> {
    return this.apiService.get(`/base64ToPng/${id}`);
  }

  add(body) : Observable<Base64ToPng> {
    return this.apiService.post(`/base64ToPng/`, body);
  }

  edit(body, base64ToPngId: number) : Observable<Base64ToPng> {
    return this.apiService.post(`/base64ToPng/${base64ToPngId}`, body);
  }

  delete(id: number) : Observable<Base64ToPng> {
    return this.apiService.put(`/base64ToPng/${id}`);
  }
/*
  base64ToPng(name: string, code: string): Observable<any> {
    return this.apiService.post(`/base64ToPng/${name}/${code}`);
  }
*/

}


 