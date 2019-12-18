import { Component, ViewEncapsulation, OnInit , ViewChild, ElementRef} from '@angular/core';

import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {QrScannerComponent} from "angular2-qrscanner";

declare var QRCode: any;

@Component({
    selector: 'app-adminscan',
    templateUrl: './adminscan.component.html',
    styleUrls: ['./adminscan.component.scss']
})

export class AdminscanComponent implements OnInit {


  // query results available in ngOnInit
  @ViewChild('qr_scanner_admin', {static: true}) qrScannerComponent: QrScannerComponent;

  /*
   @ViewChild('QrScannerComponent') qrScannerComponent: QrScannerComponent ;
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

  closeResult: string;

  public myAngularxQrCode: string = null;

  private artqrcode_options: any ;
  private artqrcode:  any ;


  constructor(private http: HttpClient, private modalService: NgbModal) {
  //  this.getAdmins();
    this.myAngularxQrCode = 'Your initial QR code data string';



  // artqrcode_options
  this.artqrcode_options = {
    text: 'Hamza Spotfit QrCode ^^',
    /**
     * width,height 是输出图的宽高
     * codeWidth,codeHeight 是二维码的宽高
     * top,left 是二维码区域的定位
     */
    width: 500,
    height: 500,
    codeWidth: 320,
    codeHeight: 320,
    top: 85,
    left: 80,
    /**
     * materials unit options
     */
    materials: {
      border: '../../../assets/materials/electron/border.png',
      eye: '../../../assets/materials/electron/eye.png',
      row4: '../../../assets/materials/electron/row4.png',
      col4: '../../../assets/materials/electron/col3.png',
      row2col3: '../../../assets/materials/electron/row2col3.png',
      row3col2: '../../../assets/materials/electron/row3col2.png',
      col3: ['../../../assets/materials/electron/col3.png', '../../../assets/materials/electron/col3_2.png'],
      row2col2: '../../../assets/materials/electron/row2col2.png',
      corner: '../../../assets/materials/electron/corner.png',
      row2: ['../../../assets/materials/electron/row2.png', '../../../assets/materials/electron/row2_2.png'],
      col2: '../../../assets/materials/electron/col2.png',
      single: ['../../../assets/materials/electron/single.png', '../../../assets/materials/electron/single_2.png'],
    }
  };
  // end artqrcode_options
}

/*
  getAdmins(): void {
    this.adminService.getAdmins().subscribe(
      admins => this.admins = admins
    );
  }

*/



  ngOnInit() {
    this.loadArtQrCode();
    // Customizer JS File
   //  $.getScript('./assets/js/customizer.js');

/*
      this.qrScannerComponent.capturedQr.subscribe(result => {
        console.log("-------------------- QR CODE --------------------");
        console.log(result);
        console.log("-------------------------------------------------");
      });
*/

  }// end ngOnInit






  openDiv(idDiv) {
    $('#' + idDiv).slideDown(800);
  }
  closeDiv(idDiv) {
    $('#' + idDiv).slideUp(800);
  }
  toggleDiv(idDiv) {
    $('#' + idDiv).slideToggle(800);
  }





  open(content) {
    this.modalService.open(content, {size: 'lg' }).result.then((result) => {
        this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });

}


resizepage() {
   // this.pageSize= this.vehiculeData.length;
}


opensm(content) {
    this.modalService.open(content, { }).result.then((result) => {
        this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
}


private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
        return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
        return 'by clicking on a backdrop';
    } else {
        return  `with: ${reason}`;
    }
}




/*
  open_qrcode_scanner() {
    this.qrScannerComponent.getMediaDevices().then(devices => {
      console.log(devices);
      const videoDevices: MediaDeviceInfo[] = [];
      for (const device of devices) {
          if (device.kind.toString() === 'videoinput') {
              videoDevices.push(device);
          }
      }
      if (videoDevices.length > 0){
          let choosenDev;
          for (const dev of videoDevices){
              if (dev.label.includes('front')){
                  choosenDev = dev;
                  break;
              }
          }
          if (choosenDev) {
              this.qrScannerComponent.chooseCamera.next(choosenDev);
          } else {
              this.qrScannerComponent.chooseCamera.next(videoDevices[0]);
          }
      }
  });

  this.qrScannerComponent.capturedQr.subscribe(result => {
    console.log('****** rScannerComponent result *****');
    console.log(result);
    this.getByQrCode(result);
  });
}//end  open_qrcode_scanner()




  changeCurrentQrCode(newQrCode: string) {
    // assign a value
    console.log('newQrCode :');
    console.log(newQrCode);
    this.myAngularxQrCode = newQrCode ;
  }
*/





getByQrCode ($qrcode_val): void {
/*
  this.adminService.getByQrCode($qrcode_val).subscribe(current_controlled_user => {
    this.current_controlled_user = current_controlled_user;

    console.log(this.current_controlled_user);

    // set current Admin infos into VIEW
    this.val_login.nativeElement.innerHTML = this.current_controlled_user[0].login;
    this.val_name.nativeElement.innerHTML = this.current_controlled_user[0].first_name + ' ' + this.current_controlled_user[0].last_name;
    this.val_email.nativeElement.innerHTML = this.current_controlled_user[0].email;
    this.val_phone.nativeElement.innerHTML = this.current_controlled_user[0].phone_number;
    this.val_function.nativeElement.innerHTML = this.current_controlled_user[0].function;
    this.val_photo.nativeElement.src = '../../../assets/img/avatars/' + this.current_controlled_user[0].photo;
    this.val_adress.nativeElement.innerHTML = this.current_controlled_user[0].address;

//        console.log(this.qrScannerComponent );
});
*/
}


open_qrcode_scanner() {
  this.qrScannerComponent.getMediaDevices().then(devices => {
    console.log(devices);
    const videoDevices: MediaDeviceInfo[] = [];
    for (const device of devices) {
        if (device.kind.toString() === 'videoinput') {
            videoDevices.push(device);
        }
    }
    if (videoDevices.length > 0){
        let choosenDev;
        for (const dev of videoDevices){
            if (dev.label.includes('front')){
                choosenDev = dev;
                break;
            }
        }
        if (choosenDev) {
            this.qrScannerComponent.chooseCamera.next(choosenDev);
        } else {
            this.qrScannerComponent.chooseCamera.next(videoDevices[0]);
        }
    }
});

this.qrScannerComponent.capturedQr.subscribe(result => {
  console.log('****** rScannerComponent result *****');
  console.log(result);
  this.getByQrCode(result);
});
}//end  open_qrcode_scanner()




changeCurrentQrCode(newQrCode: string) {
  // assign a value
  console.log('newQrCode :');
  console.log(newQrCode);
  this.myAngularxQrCode = newQrCode ;
}




/*
 * Artqrcode
 */
loadArtQrCode() {
     //  use artqrcode_options
     this.artqrcode = new QRCode(document.getElementById('div_current_qrcode_art'),  this.artqrcode_options);
  }






}
