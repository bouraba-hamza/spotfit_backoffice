import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient } from '@angular/common/http';
import { ToastData, ToastOptions, ToastyService } from 'ng2-toasty';
import { FormControl, FormGroup, FormBuilder } from '@angular/forms';
import { Materiel } from './materiel';
import { MaterielModule } from './materiel.module';
import { MaterielService } from './materiel.service';
import { Observable } from 'rxjs/Observable';
declare const $: any;

import { StarRatingComponent } from 'ng-starrating';

@Component({
    selector: 'app-materiel',
    templateUrl: './materiel.component.html',
    styleUrls: ['./materiel.component.scss'],
})
export class MaterielComponent implements OnInit {

    /*
         @ViewChild(PaginationComponent)
         private paginationComponent: PaginationComponent;
    */
    pageSize = 5;
    pageNumber = 1;

    title = 'app';
    position = 'bottom-right';
    msg: string;
    showClose = true;
    res: any;
    timeout = 5000;
    theme = 'bootstrap';
    type = 'default';
    closeOther = false;

    materielData: any;
    materiel: Materiel[];
    materielPost: Materiel;
    materiels: Materiel[];

    /*
         gyms: Gym[];
    */

    closeResult: string;
    myform: FormGroup;
    myformUpdate: FormGroup;

    id: FormControl;
    libelle: FormControl;
    code_barre: FormControl;
    gamme: FormControl;
    etat: FormControl;
    image: FormControl;


    constructor(private fb: FormBuilder, private materielService: MaterielService, private http: HttpClient, private modalService: NgbModal, private toastyService: ToastyService) {
    }

    /*
      getGyms(): void {
        this.gymService.getGyms().subscribe(
          gyms => this.gyms = gyms
        );
      }
      */



    ngOnInit() {

        this.createForm();
        this.createFormControls();
        this.createFormUpdate();
        this.createFormControlsUpdate();

        //  this.getGyms();
        this.getMateriels();


    } // end ngOnInit()




    getMateriels(): void {
        this.materielService.getMateriels().subscribe(
            materiels => {
                this.materiels = materiels
            });
        //  console.log('materiels');
        // console.log(this.materiels);
    };



    onRate($event: { oldValue: number, newValue: number, starRating: StarRatingComponent }) {
        console.log(`Old Value:${$event.oldValue},
 New Value: ${$event.newValue},
 Checked Color: ${$event.starRating.checkedcolor},
 Unchecked Color: ${$event.starRating.uncheckedcolor}`);
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







    createFormUpdate() {
        // this.myformUpdate = new FormGroup({
        //     id: this.id,
        //     libelle: this.libelle,
        //     code_barre: this.code_barre,
        //     gamme: this.gamme,
        //     etat: this.etat,
        //     image: this.image
        // });
        this.myformUpdate = this.fb.group({
            id: [''],
            libelle: [''],
            code_barre: [''],
            gamme: [''],
            etat: [''],
            image: ['']
        });
    }
    createFormControlsUpdate() {
        this.id = new FormControl('');
        this.libelle = new FormControl('');
        this.code_barre = new FormControl('');
        this.gamme = new FormControl('');
        this.etat = new FormControl('');
        this.image = new FormControl('');
    }
    createFormControls() {
        this.id = new FormControl('');
        this.libelle = new FormControl('');
        this.code_barre = new FormControl('');
        this.gamme = new FormControl('');
        this.etat = new FormControl('');
        this.image = new FormControl('');
    }
    createForm() {
        this.myform = this.fb.group({
            libelle: [''],
            code_barre: [''],
            gamme: [''],
            etat: [''],
            image: ['']
        });
    }







    onUpdate(id, libelle, code_barre, gamme, etat, image) {
        console.log(id);
        if (this.myformUpdate.valid) {

                         this.materielPost = new Materiel();
                         this.materielPost.id = id;
                         this.materielPost.libelle = this.myformUpdate.value['libelle'] ? this.myformUpdate.value['libelle'] : libelle;
                         this.materielPost.code_barre = this.myformUpdate.value['code_barre'] ? this.myformUpdate.value['code_barre'] : code_barre;
                         this.materielPost.gamme = this.myformUpdate.value['gamme'] ? this.myformUpdate.value['gamme'] : gamme;
                         this.materielPost.etat = this.myformUpdate.value['etat'] ? this.myformUpdate.value['etat'] : etat;
                         this.materielPost.image = this.myformUpdate.value['image'] ? this.myformUpdate.value['image'] : image;
                         
                         this.materielService.updateMateriel( this.materielPost ).subscribe(materielPostconsole => {
                                 try {
                                         this.addToast({title:'', msg:'Materiel modifié avec succès', timeout: 2000, theme:'bootstrap', position:'top-right', type:'success'});
                                         //this.myform.reset();
                                         setTimeout(() => {this.ngOnInit(); }, 1000);
                                 } catch (e) {
                                     this.addToast({title:'', msg:'Le Materiel n\'est pas modifié', timeout: 2000, theme:'bootstrap', position:'top-right', type:'error'});
                                 }
                             }
                         );
                     
        }
    }





    onSubmit(e) {
        // e.preventDefault();
        console.log(e);
        if (this.myform.valid) {
            this.materielPost = new Materiel();
            this.materielPost.libelle = this.myform.value['libelle'];
            this.materielPost.code_barre = this.myform.value['code_barre'];
            this.materielPost.gamme = this.myform.value['gamme'];
            this.materielPost.etat = this.myform.value['etat'];
            this.materielPost.image = this.myform.value['image'];
            console.log("materielPost");
            console.log(this.myform.value);
            

            this.materielService.addMateriel(this.materielPost).subscribe(materielPostconsole => {
                try {
                    this.addToast({ title: '', msg: 'Materiel ajouté avec succès', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'success' });
                    this.myform.reset();
                    setTimeout(() => { this.ngOnInit(); }, 1000);
                    console.log(this.materielPost.libelle);
                } catch (e) {
                    console.log(e);
                    this.addToast({ title: '', msg: 'Le Materiel n\'est pas ajouté', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'error' });
                }
            });
        }
    }




    delete(materiel: Materiel): void {
        this.addToast({ title: '', msg: 'Materiel en cours ' + materiel.id, timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'wait' });
        this.materielService.deleteMateriel(materiel).subscribe(materielPostconsole => {
            try {
                this.addToast({ title: '', msg: 'Materiel supprimé avec succès', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'success' });
                setTimeout(() => { this.ngOnInit(); }, 1000);
            } catch (e) {
                console.log(e);
                this.addToast({ title: '', msg: 'Materiel n\'est aps supprimé', timeout: 2000, theme: 'bootstrap', position: 'top-right', type: 'error' });
            }
        });
        setTimeout(() => { this.ngOnInit(); }, 1000);
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

    /*
            //show hide miniature equipement .. get All
            show_img_materiel(idImg) {
              let current_img_src = $("#img_materiel_"+idImg).attr('src');
              console.log('go show img : '+current_img_src );
    
              $("#img_show_materiel").attr('src', current_img_src);
              $("#img_show_materiel").fadeIn(300);
            }
            hide_img_materiel(idImg) {
              let current_img_src = $("#img_materiel_"+idImg).attr('src');
              console.log('go hide img : '+current_img_src );
              $("#img_show_materiel").fadeOut(300);
            }
     */





}
