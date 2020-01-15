import { Component, ViewEncapsulation, OnInit , ViewChild, ElementRef} from '@angular/core';

import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';

import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';


@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})

export class HomeComponent implements OnInit {


 constructor(/*private adminService: AdminService*/) {
 }

  ngOnInit() {
  }/* end ngOnInit */

}
