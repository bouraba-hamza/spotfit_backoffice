import { Component, ViewEncapsulation, OnInit , ViewChild, ElementRef} from '@angular/core';

import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';

import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';


@Component({
    selector: 'app-documentation',
    templateUrl: './documentation.component.html',
    styleUrls: ['./documentation.component.scss']
})

export class DocumentationComponent implements OnInit {


 constructor(/*private adminService: AdminService*/) {
 }

  ngOnInit() {
  }/* end ngOnInit */

}
