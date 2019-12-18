import { Component, ViewEncapsulation, OnInit } from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {catchError, tap} from 'rxjs/operators';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import { ToastData, ToastOptions, ToastyService } from 'ng2-toasty';
import { FormControl, FormGroup, FormBuilder } from '@angular/forms';
declare const $: any;
import { StarRatingComponent } from 'ng-starrating';
import { GymService } from './gym.service';
import {Gym} from "./gym";

@Component({
    selector: 'app-gym',
    templateUrl: './gym.component.html',
    styleUrls: ['./gym.component.scss'],
    encapsulation: ViewEncapsulation.None
})

export class GymComponent  implements OnInit {
    title = 'app';
    position = 'bottom-right';
    msg: string;
    showClose = true;
    res: any;
    timeout = 5000;
    theme = 'bootstrap';
    type = 'default';
    closeOther = false;

    gymData: any;
    gym: Gym[];
    gymPost: Gym;
    gyms: Gym[];

    closeResult: string;
    myform: FormGroup;
    myformUpdate: FormGroup;

    id: FormControl;
    logo: FormControl;
    qrcode: FormControl;
    name: FormControl;
    adress: FormControl;
    tel: FormControl;
    gamme: FormControl;
    avis: FormControl;

    currentRate: Number; //temporary for get val ...


    public gymAngularxQrCode: string = null;

  constructor(private fb: FormBuilder, private gymService: GymService, private http: HttpClient, private modalService: NgbModal, private toastyService: ToastyService) {
    this.gymAngularxQrCode = 'initials Gyms QR code';
  }


  ngOnInit() {
    this.createForm();
    this.createFormControls();
    this.createFormUpdate();
    this.createFormControlsUpdate();

    this.getGyms();
}


  getGyms(): void {
    this.gymService.getGyms().subscribe(
      gyms => this.gyms = gyms
    );
  }




    //  For confirm action On Delete
    onDeleteConfirm(event) {
        if (window.confirm('Are you sure you want to delete?')) {
            event.confirm.resolve();
        } else {
            event.confirm.reject();
        }
    }

    //  For confirm action On Save
    onSaveConfirm(event) {
        if (window.confirm('Are you sure you want to save?')) {
            event.newData['name'] += ' + added in code';
            event.confirm.resolve(event.newData);
        } else {
            event.confirm.reject();
        }
    }

    //  For confirm action On Create
    onCreateConfirm(event) {
        if (window.confirm('Are you sure you want to create?')) {
            event.newData['name'] += ' + added in code';
            event.confirm.resolve(event.newData);
        } else {
            event.confirm.reject();
        }
    }









    createFormUpdate() {
        this.myformUpdate = this.fb.group({
            id: [''],
            logo: [''],
            qrcode: [''],
            name: [''],
            adress: [''],
            tel: [''],
            gamme: [''],
            avis: ['']
        });
    }
    createFormControlsUpdate() {
        this.id = new FormControl('');
        this.logo = new FormControl('');
        this.qrcode = new FormControl('');
        this.name = new FormControl('');
        this.adress = new FormControl('');
        this.tel = new FormControl('');
        this.gamme = new FormControl('');
        this.avis = new FormControl('');
    }
    createFormControls() {
        this.id = new FormControl('');
        this.logo = new FormControl('');
        this.qrcode = new FormControl('');
        this.name = new FormControl('');
        this.adress = new FormControl('');
        this.tel = new FormControl('');
        this.gamme = new FormControl();
        this.avis = new FormControl();
    }
    createForm() {
        this.myform = this.fb.group({
            logo: [''],
            qrcode: [''],
            name: [''],
            adress: [''],
            tel: [''],
            gamme: [''],
            avis: ['']
        });
    }














    onSubmit(e) {
        // e.preventDefault();
        console.log(e);
        if (this.myform.valid) {
            this.gymPost = new Gym();
            this.gymPost.logo = this.myform.value['logo'];
            this.gymPost.qrcode = this.myform.value['qrcode'];
            this.gymPost.name = this.myform.value['name'];
            this.gymPost.adress = this.myform.value['adress'];
            this.gymPost.tel = this.myform.value['tel'];
            this.gymPost.gamme = this.myform.value['gamme'];
            //this.gymPost.avis = this.myform.value['avis'];
             this.gymPost.avis = this.currentRate + '';


            console.log("this.myform.value['logo']");
            console.log(this.myform.value['logo']);

            console.log("this.myform.value");
            console.log(this.myform.value);

            this.gymService.addGym(this.gymPost).subscribe(gymPostconsole => {
                try {
                    this.addToast({ title: '', msg: 'Gym ajouté avec succès', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'success' });
                    this.myform.reset();
                    setTimeout(() => { this.ngOnInit(); }, 1000);
                    console.log(this.gymPost.name);
                } catch (e) {
                    console.log(e);
                    this.addToast({ title: '', msg: 'Le Gym n\'est pas ajouté', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'error' });
                }
            });
        }
    }






    onUpdate(id, logo, qrcode, name, adress, tel, gamme, avis) {
        console.log(id);

                         this.gymPost = new Gym();
                         this.gymPost.id = id;
                         this.gymPost.logo = this.myformUpdate.value['logo'] ? this.myformUpdate.value['logo'] : logo;
                         this.gymPost.qrcode = this.myformUpdate.value['qrcode'] ? this.myformUpdate.value['qrcode'] : qrcode;
                         this.gymPost.name = this.myformUpdate.value['name'] ? this.myformUpdate.value['name'] : name;
                         this.gymPost.adress = this.myformUpdate.value['adress'] ? this.myformUpdate.value['adress'] : adress;
                         this.gymPost.tel = this.myformUpdate.value['tel'] ? this.myformUpdate.value['tel'] : tel;
                         this.gymPost.gamme = this.myformUpdate.value['gamme'] ? this.myformUpdate.value['gamme'] : gamme;
                      //   this.gymPost.avis = this.myformUpdate.value['avis'] ? this.myformUpdate.value['avis'] : avis;
                         this.gymPost.avis = this.myformUpdate.value['avis'] ? this.myformUpdate.value['avis'] : this.currentRate;
                        // this.gymPost.avis = this.currentUpdateRate + '';
                        
                        console.log('this.currentRate');
                        console.log(this.currentRate);

                         this.gymService.updateGym( this.gymPost ).subscribe(gymPostconsole => {
                                 try {
                                         this.addToast({title:'', msg:'Gym modifié avec succès', timeout: 2000, theme:'bootstrap', position:'top-right', type:'success'});
                                         //this.myform.reset();
                                         setTimeout(() => {this.ngOnInit(); }, 1000);
                                 } catch (e) {
                                     this.addToast({title:'', msg:'Le Gym n\'est pas modifié', timeout: 2000, theme:'bootstrap', position:'top-right', type:'error'});
                                 }
                             }
                         );
                     
    }
    



    delete(gym: Gym): void {
        this.addToast({ title: '', msg: 'Gym en cours ' + gym.id, timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'wait' });
        this.gymService.deleteGym(gym).subscribe(GymPostconsole => {
            try {
                this.addToast({ title: '', msg: 'Gym supprimé avec succès', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'success' });
                setTimeout(() => { this.ngOnInit(); }, 1000);
            } catch (e) {
                console.log(e);
                this.addToast({ title: '', msg: 'Gym n\'est aps supprimé', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'error' });
            }
        });
        setTimeout(() => { this.ngOnInit(); }, 1000);
    }















    onRate($event: { oldValue: number, newValue: number, starRating: StarRatingComponent }) {
      console.log(`Old Value:${$event.oldValue},
New Value: ${$event.newValue},
Checked Color: ${$event.starRating.checkedcolor},
Unchecked Color: ${$event.starRating.uncheckedcolor}`);

     this.currentRate = $event.newValue ;
  }


  addToast(options) {
    if (options.closeOther) {
        this.toastyService.clearAll();
    }
    this.position = options.position ? options.position : this.position;
    const toastOptions: ToastOptions = {
        title: options.title,
        msg: options.msg,
        showClose: options.showClose,
        timeout: options.timeout,
        theme: options.theme,


        onAdd: (toast: ToastData) => {
            console.log('Toast ' + toast.id + ' has been added!');
        },
        onRemove: (toast: ToastData) => {
            console.log('Toast ' + toast.id + ' has been added removed!');
        }
    };

    switch (options.type) {
        case 'default': this.toastyService.default(toastOptions); break;
        case 'info': this.toastyService.info(toastOptions); break;
        case 'success': this.toastyService.success(toastOptions); break;
        case 'wait': this.toastyService.wait(toastOptions); break;
        case 'error': this.toastyService.error(toastOptions); break;
        case 'warning': this.toastyService.warning(toastOptions); break;
    }
}












  open(content) {
    this.modalService.open(content, { size: 'lg' }).result.then((result) => {
        this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });

}


resizepage() {
    // this.pageSize= this.vehiculeData.length;
}


opensm(content) {
    this.modalService.open(content, {}).result.then((result) => {
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
        return `with: ${reason}`;
    }
}



}
