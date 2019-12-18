import { Component, ViewEncapsulation, OnInit , ViewChild, ElementRef} from '@angular/core';
import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';

import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';


@Component({
    selector: 'app-robot',
    templateUrl: './robot.component.html',
    styleUrls: ['./robot.component.scss']
})

export class RobotComponent implements OnInit {


 constructor(/*private adminService: AdminService*/) {
 }

  ngOnInit() {
  }/* end ngOnInit */

}
