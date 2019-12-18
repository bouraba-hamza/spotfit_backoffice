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
  //@ViewChild(QrScannerComponent) qrScannerComponent: QrScannerComponent ;
/*
  @ViewChild('val_login') val_login: ElementRef;
  @ViewChild('val_name') val_name: ElementRef;
  @ViewChild('val_email') val_email: ElementRef;
  @ViewChild('val_phone') val_phone: ElementRef;
  @ViewChild('val_function') val_function: ElementRef;
  @ViewChild('val_login') current_photo: ElementRef;
  @ViewChild('div_current_qrcode') div_current_qrcode: ElementRef;
  @ViewChild('val_photo') val_photo: ElementRef;
  @ViewChild('val_adress') val_adress: ElementRef;
*/

 // public current_admin: Admin[];
  public myAngularxQrCode: string = null;

  constructor(/*private adminService: AdminService*/) {

    this.myAngularxQrCode = 'Your initial QR code data string';

   // console.log('******* CONSTRUCTOR : Initial QR code data string *******');
   // this.myAngularxQrCode = 'Initial QR code data string';
 }

  ngOnInit() {
     // getAuthenticatedUser
   //  this.getAuthenticatedAdmin();
  }//end ngOnInit

     /*
    //front end SuperAdmin ONLY ...
    getAuthenticatedAdmin(): void {
 
      this.adminService.getAuthenticatedAdmin().subscribe(
        admin => this.current_admin = admin
      );

      this.adminService.getAuthenticatedAdmin().subscribe(adminconsole => {
        this.current_admin = adminconsole;

        console.log(this.current_admin);

        // set current Admin infos into VIEW
        this.val_login.nativeElement.innerHTML = this.current_admin['user'].login;
        this.val_name.nativeElement.innerHTML = this.current_admin['user'].first_name + ' ' + this.current_admin['user'].last_name;
        this.val_email.nativeElement.innerHTML = this.current_admin['user'].email;
        this.val_phone.nativeElement.innerHTML = this.current_admin['user'].phone_number;
        this.val_function.nativeElement.innerHTML = this.current_admin['user'].function;
        this.val_photo.nativeElement.src = '../../../assets/img/avatars/' + this.current_admin['user'].photo;

        this.changeCurrentQrCode(this.current_admin['user'].qrcode);
     //   const new_qrcode = `<qr-code #current_qrcode id="current_qrcode" [value]="'qrcode'" [size]="150"></qr-code>`;
    //    this.div_current_qrcode.nativeElement.innerHTML = new_qrcode;

        //$('#div_current_qrcode').val(this.current_admin['user'].qrcode);

        this.val_adress.nativeElement.innerHTML = this.current_admin['user'].adress;

//        console.log(this.qrScannerComponent );

    });


    }//end getAuthenticatedAdmin...

    changeCurrentQrCode(newQrCode: string) {
      // assign a value
      console.log('newQrCode :');
      console.log(newQrCode);
      this.myAngularxQrCode = newQrCode ;
    }
*/
}
