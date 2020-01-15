import { Component, ViewEncapsulation, OnInit , ViewChild, ElementRef} from '@angular/core';

import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';

import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
//import { Admin } from './Admin';

//import {QrScannerComponent} from 'angular2-qrscanner';


@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styleUrls: ['./profile.component.scss']
})

export class ProfileComponent implements OnInit {
  public myAngularxQrCode: string = null;

  constructor(/*private adminService: AdminService*/) {

 }

  ngOnInit() {
  }

}
