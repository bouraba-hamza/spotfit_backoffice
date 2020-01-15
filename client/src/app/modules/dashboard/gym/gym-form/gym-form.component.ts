import {
  ChangeDetectionStrategy,
  ViewChild,
  TemplateRef,
  ChangeDetectorRef
} from '@angular/core';

import {
  startOfDay,
  endOfDay,
  subDays,
  addDays,
  endOfMonth,
  isSameDay,
  isSameMonth,
  addHours
} from 'date-fns';


import { Subject } from 'rxjs';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import {
  CalendarEvent,
  CalendarEventAction,
  CalendarEventTimesChangedEvent
} from 'angular-calendar';


const colors: any = {
  red: {
    primary: '#ad2121',
    secondary: '#FAE3E3'
  },
  blue: {
    primary: '#1e90ff',
    secondary: '#D1E8FF'
  },
  yellow: {
    primary: '#e3bc08',
    secondary: '#FDF1BA'
  }
};

import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Gym } from "@app/@core/models/gym";
import { Base64ToPng } from "@app/@core/models/Base64ToPng";
import { FormGroup, FormBuilder, FormControl } from "@angular/forms";
import { GymService } from "@app/@core/http/gym.service";
import { GroupService } from '@app/@core/http/group.service';
import { PassService } from '@app/@core/http/pass.service';
import { ClasseService } from '@app/@core/http/classe.service';
import { FacilitieService } from '@app/@core/http/facilitie.service';
import { Base64ToPngService } from '@app/@core/http/base64ToPng.service';
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

import { trigger, state, transition, style, animate } from '@angular/animations';


import * as jsPDF from 'jspdf';
import * as html2canvas from 'html2canvas';

import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { Guid } from 'guid-typescript';
import { Group } from '@app/@core/models/group';
import { Classe } from '@app/@core/models/classe';
import { Pass } from '@app/@core/models/pass';
import { Facilitie } from '@app/@core/models/facilitie';
import { HttpEventType } from '../../../../../../node_modules/@angular/common/http';
import { StarRatingComponent } from '../../../../../../node_modules/ng-starrating';

@Component({
  selector: "app-gym-form",
  changeDetection: ChangeDetectionStrategy.OnPush,
  templateUrl: "./gym-form.component.html",
  styleUrls: ["./gym-form.component.scss"],
  providers: [ToastrService],
  animations: [
    trigger('visibilityChanged', [
      state('shown', style({ opacity: 1 , display: 'block'})),
      state('hidden', style({ opacity: 0 , display: 'none'})),
      transition('shown => hidden', animate('600ms')),
      transition('hidden => shown', animate('300ms')),
    ])
  ]
})
export class GymFormComponent implements OnInit {
  heading: string;
  type: string;
  gym: Gym;
  gymForm: FormGroup;
  inProgress: boolean = false;
  base64ToPng: Base64ToPng;
  imagePath: SafeResourceUrl;
  guid: Guid;

  currentRate: Number = 0; //temporary for get val ...

  //upload logo
  fileData: File = null;
  previewUrl: any = null;
  fileUploadProgress: string = null;
  uploadedFilePath: string = null;

  groups: [Group] ;
  classes: [Classe] ;
  passes: [Pass] ;
  facilities: [Facilitie]  ;

  facilities_left:  Array<any> = [];
  facilities_choices: Array<any> = [];
  facilities_choices_id_facilitie = [];
  facilities_choices_name_facilitie = [];

/* CALENDAR */
show_calendar = 'hidden';
//html2canvas = require('hmtl2canvas');

@ViewChild('modalContent', {static: false}) modalContent: TemplateRef<any>;
view: string = 'week';
newEvent: CalendarEvent;
viewDate: Date = new Date();
modalData: {
  action: string;
  event: CalendarEvent;
};
actions: CalendarEventAction[] = [
  {
    label: '<i class="fa fa-fw fa-pencil"></i>',
    onClick: ({ event }: { event: CalendarEvent }): void => {
      this.handleEvent('Edit this event', event);
    }
  }
];
refresh: Subject<any> = new Subject();
events: CalendarEvent[] = [
  {
    start: addHours(startOfDay(new Date()), 2),
    end: new Date(),
    title: 'A draggable and resizable event',
    color: colors.yellow,
    actions: this.actions,
    resizable: {
      beforeStart: true,
      afterEnd: true
    },
    draggable: true
  }
];
activeDayIsOpen: boolean = true;

events_ =  JSON.stringify(this.events);


dayClicked({ date, events }: { date: Date; events: CalendarEvent[] }): void {
  if (isSameMonth(date, this.viewDate)) {
    if (
      (isSameDay(this.viewDate, date) && this.activeDayIsOpen === true) ||
      events.length === 0
    ) {
      this.activeDayIsOpen = false;
    } else {
      this.activeDayIsOpen = true;
      this.viewDate = date;
    }
  }
}

eventTimesChanged({
    event,
  newStart,
  newEnd
  }: CalendarEventTimesChangedEvent): void {
  event.start = newStart;
  event.end = newEnd;
  this.handleEvent('Dropped or resized', event);
  this.refresh.next();
}

handleEvent(action: string, event: CalendarEvent): void {
  this.modalData = { event, action };
  this.modal.open(this.modalContent, { size: 'lg' });
}

addEvent(): void {
  this.newEvent = {
    title: 'New event',
    start: startOfDay(new Date()),
    end: endOfDay(new Date()),
    color: colors.red,
    draggable: true,
    resizable: {
      beforeStart: true,
      afterEnd: true
    },
    actions: this.actions,
  }
  this.events.push(this.newEvent);

  // this.refresh.next();
  this.handleEvent('Add new event', this.newEvent);
   this.refresh.next();
}
/* END CALENDAR */




  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private gymService: GymService,
    private groupService: GroupService,
    private passService: PassService,
    private classeService: ClasseService,
    private facilitieService: FacilitieService,
    private base64ToPngService: Base64ToPngService,
    private toastr: ToastrService,
    private underscore: UnderscoreService,
    private modal: NgbModal,
    private _sanitizer: DomSanitizer,
    private cdRef: ChangeDetectorRef
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du gym";
      this.gymForm = this.createAddForm();
    } else {
      this.heading = "La modification du gym";
      this.route.data
        .pipe(map(data => data.gym))
        .subscribe((gym: Gym) => {
          this.gym = gym;
          console.log(this.gym);
          this.gymForm = this.createEditForm(this.gym);
        });
    }

    //this.pdfSrc = 'https://vadimdez.github.io/ng2-pdf-viewer/assets/pdf-test.pdf';
     this.guid = Guid.create(); // ==> b77d409a-10cd-4a47-8e94-b0cd0ab50aa1
     this.gymForm.get('qrcode').setValue(this.guid + '');

     this.imagePath = 'http://localhost:8000/uploads/img/illustration-icone.jpg' ;
  }

  ngOnInit() {
    this.load_all_groups();
    this.load_all_classes();
    this.load_all_passes();
    this.load_all_facilities();

    /*
  let htmlElem = document.querySelector("#capture");
  html2canvas(document).then( function(canvas) {
      // Convert the canvas to blob
      canvas.toBlob(function(blob){
          // To download directly on browser default 'downloads' location
          let link = document.createElement("a");
          link.download = "image.png";
          link.href = URL.createObjectURL(blob);
          link.click();

          // To save manually somewhere in file explorer
          window.saveAs(blob, 'image.png');

      },'image/png');
  });
*/

  }



  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.gymForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    // upload lop image
    formData.append('file', this.fileData);
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.gymService.add(formData).subscribe((response: any) => {

        if (response.gym_id !== undefined && response.gym_id > 0) {

          this.toastr.success(
              `le gym a été ajouter avec succès avec ID: ${response.gym_id}`,
              this.heading,
              { timeOut: 5000 }
          );
          this.router.navigate(["../"], { relativeTo: this.route });
        } else {
          this.toastr.error(`${response.errors[0]}`, this.heading, {
            closeButton: true
          });
        }
      }, (error) => { console.error(error)}, () => { this.inProgress = false; });
    } else {
      this.gymService.edit(formData, this.gym.id)
          .subscribe((response: any) => {
            if (response.gym_id !== undefined && response.gym_id > 0) {
              this.toastr.success(
                  `le gym a été modifier avec succès`,
                  this.heading,
                  { timeOut: 5000 }
              );
              this.router.navigate(["../"], { relativeTo: this.route });
            } else {
              this.toastr.error(`${response.errors[0]}`, this.heading, {
                closeButton: true
              });
            }
          }, (error) => { console.error(error)}, () => { this.inProgress = false; });
    }
  }



  createAddForm() {
    return this.gymForm = this.fb.group({

     group_id: [null], 
     logo: [null], 
     name: [null], 
     rate: [null], 
     qrcode: [null], 
     class_id: [null],
     facilities: [null],
     planning: [null]
    });
  }

  createEditForm(gym: Gym) {
    return this.gymForm = this.fb.group({

     group_id: [gym.group_id], 
     logo: [gym.logo], 
     name: [gym.name], 
     rate: [gym.rate], 
     qrcode: [gym.qrcode], 
     class_id: [gym.class_id], 
     facilities: [gym.facilities],
     planning: [gym.planning]
    });
  }




  select_current_facilitie(event) {
    const id_facilitie    = event.target.value;
    const name_facilitie  = event.target.options[event.target.options.selectedIndex].text ;
    console.log('id_facilitie: ' + id_facilitie + '  name_facilitie: ' + name_facilitie);

    console.log('ALL FACILITIES CHOICES');
   // id_facilitie = Number(id_facilitie - 1);
   // this.facilities_choices.push(this.facilities_left.splice((Number(id_facilitie)), 1));

    if ( !this.facilities_choices_id_facilitie.includes(id_facilitie)) {

     // this.facilities_choices_id_facilitie.push( id_facilitie   );
     // this.facilities_choices_name_facilitie.push(  name_facilitie   );
    //  this.facilities_choices.push(  [id_facilitie  , name_facilitie] );

     // this.facilities_choices_id_facilitie[id_facilitie]     = id_facilitie      ;
    //  this.facilities_choices_name_facilitie[id_facilitie]   = name_facilitie   ;

      this.facilities_choices_id_facilitie.push(  id_facilitie   );
      this.facilities_choices_name_facilitie.push(  name_facilitie   );

      this.facilities_choices[id_facilitie]                  = [id_facilitie  , name_facilitie]   ;
    }

    console.log('ALL FACILITIES LEFT');
    //this.facilities_left.splice((Number(id_facilitie) - 1), 1);
    console.log(this.facilities_left);

    console.log('ALL facilities_choices_id_facilitie');
    console.log(this.facilities_choices_id_facilitie);

    console.log('ALL facilities_choices_name_facilitie');
    console.log(this.facilities_choices_name_facilitie);


}


remove_facilitie(facilitie_id) {
  console.log('/////////////////////////////////////////////////////////////');
  console.log('remove_facilitie(' + (Number(facilitie_id)) + ')');
  console.log('pur db  select array facilities_choices_id_facilitie : ' + Number(facilitie_id) );
  console.log('pur db  select array facilities_choices_name_facilitie : ' + Number(facilitie_id) );
  console.log('pur db  select array facilities_choices : ' + Number(facilitie_id) );

  console.log('remove div_facility id : ' + Number(facilitie_id)  )
  console.log('remove element : facilities_choices_id_facilitie[' + Number(facilitie_id)  + ']'  );
  console.log('remove element : facilities_choices_name_facilitie[' + Number(facilitie_id)  + ']'  );
  console.log('remove element : facilities_choices[' + Number(facilitie_id)  + ']'  );

  this.facilities_choices_id_facilitie.splice(    Number(facilitie_id)   , 1);
  this.facilities_choices_name_facilitie.splice(    Number(facilitie_id)   , 1);
  this.facilities_choices.splice(    Number(facilitie_id)   , 1);

   console.log('NEW facilities_choices_id_facilitie[]'  );
   console.log(this.facilities_choices_id_facilitie);
   console.log('NEW facilities_choices_name_facilitie[]'  );
   console.log(this.facilities_choices_name_facilitie);
   console.log('NEW facilities_choices[]'  );
   console.log(this.facilities_choices);
   console.log('/////////////////////////////////////////////////////////////');
}


  load_all_groups() {

  this.groupService.findAll().subscribe((response: any) => {
  // if (response.group_id !== undefined && response.group_id > 0) {
    if (response !== undefined ) {
      console.log('load_all_groups');
      console.log(response);
      this.groups = response;
      this.cdRef.detectChanges(); // angular refresh image view
    //  this.all_groups = JSON.parse(JSON.stringify(response));
    } else {
      this.toastr.error(`${response.errors[0]}`, this.heading, {
        closeButton: true
      });
    }
  }, (error) => { console.error(error)}, () => { this.inProgress = false; });

  }


  load_all_classes() {

  this.classeService.findAll().subscribe((response: any) => {
      if (response !== undefined ) {
        console.log('load_all_classes');
        console.log(response);
        this.classes = response;
        this.cdRef.detectChanges(); // angular refresh image view
      } else {
        this.toastr.error(`${response.errors[0]}`, this.heading, {
          closeButton: true
        });
      }
    }, (error) => { console.error(error)}, () => { this.inProgress = false; });
  }


  load_all_passes() {

  this.passService.findAll().subscribe((response: any) => {
    if (response !== undefined ) {
      console.log('load_all_passes');
      console.log(response);
      this.passes = response;
      this.cdRef.detectChanges(); // angular refresh image view
    } else {
      this.toastr.error(`${response.errors[0]}`, this.heading, {
        closeButton: true
      });
    }
  }, (error) => { console.error(error)}, () => { this.inProgress = false; });

  }



  load_all_facilities() {

  this.facilitieService.findAll().subscribe((response: any) => {
    if (response !== undefined ) {
      console.log('load_all_facilities');
      console.log(response);
      this.facilities = response;
      this.facilities_left = this.facilities ;
      this.cdRef.detectChanges(); // angular refresh image view
    } else {
      this.toastr.error(`${response.errors[0]}`, this.heading, {
        closeButton: true
      });
    }
  }, (error) => { console.error(error)}, () => { this.inProgress = false; });

  }



  

  toggle_display_calendar_form() {
    if (this.show_calendar === 'hidden') {
      this.show_calendar = 'shown';
    } else {
      this.show_calendar = 'hidden';
    }
  }

  show_calendar_form(){
    console.log('show_calendar');
    this.show_calendar = 'shown';
    console.log('show_calendar = ' + this.show_calendar);
  }
  hide_calendar_form(){
    console.log('hide_calendar');
    this.show_calendar = 'hidden';
    console.log('show_calendar = ' + this.show_calendar);
  }

  cancel_calendar_form() {
    console.log('cancel_calendar');
    this.hide_calendar_form();
  }

  submit_calendar_form() {
    console.log('submit_calendar');
    console.log('date input:');
    const base64ToPngService = this.base64ToPngService ;
    const base64ToPng =  this.base64ToPng  ;
    const this_ =  this  ;

    // set val from ngStaring to hidden real rate input..
    this_.gymForm.get('rate').setValue(this.currentRate + '');
    // set val from result facilities choices to hidden real facilites input..
     this_.gymForm.get('facilities').setValue(this.facilities_choices_name_facilitie + ''); // hamza
     // set val from result planning choices to hidden real planning input..
      this_.gymForm.get('planning').setValue(this.events_ + '');

    //generate png jpg .. & pdf and DOWNLOAD pdf ,  image miniature planning visuel
      html2canvas(document.getElementById('calendar')).then(function(canvas) {
        const img = canvas.toDataURL('image/png');
        this_.imagePath = this_._sanitizer.bypassSecurityTrustResourceUrl(img);
        this_.cdRef.detectChanges(); // angular refresh image view



         console.log('|||||||||||||||||||||||||||||||||||||||||||||||||||  img');

         const encoded_img = btoa(img);
         const base64ToPng_ = {
         name :  'gymPlaning_' + this_.guid  + '.png',
         code :  encoded_img,
        };

       // const doc = new jsPDF();
     //   doc.addImage(img, 'PNG', 5, 20);
   //     doc.save('gymPlaning_' + this_.guid + '.pdf');
      //  const res = doc.output();
     //   this_.pdfSrc = res;


         base64ToPngService.add(base64ToPng_)
         .subscribe((response: any) => {
          console.log('gym_add_planing -> base64ToPngService : response');
          console.log(response.name);
         // this_.gymForm.get('planning').setValue(response.name + '.png');
          this_.gymForm.get('qrcode').setValue(this_.guid + '');
          this_.cdRef.detectChanges(); // angular refresh DOM view

          if (response.name !== undefined && response.name !== '') {
            this_.toastr.success(
                 `gym_add_planing -> base64ToPngService : succès`,
                 this_.heading,
                 { timeOut: 5000 }
             );
             //set miniature calendar add planing


            // this.router.navigate(["../"], { relativeTo: this.route });
           } else {
            this_.toastr.error(`${response.errors[0]}`, this_.heading, {
               closeButton: true
             });
           }
         }, (error) => { console.error(error)}, () => { this_.inProgress = false; });


         console.log('|||||||||||||||||||||||||||||||||||||||||||||||||||  res');
        // console.log(res);
      });



    this.hide_calendar_form();
  }

/*
 sendToServer() {
  const pdf = new jsPDF('p', 'pt', 'a4');
    pdf.html(document.body, {
        callback: function (pdf) {
          const obj = {};
            obj.pdfContent = pdf.output('datauristring');
            const jsonData = JSON.stringify(obj);
            $.ajax({
                url: '/api/jspdf/html2pdf',
                type: 'POST',
                contentType: 'application/json',
                data: jsonData
            });
        }
    });
}
*/









// upload logo

fileProgress(fileInput: any) {
  this.fileData = <File>fileInput.target.files[0];
  this.preview();
  this.cdRef.detectChanges(); // angular refresh image view
}

preview() {
// Show preview
const mimeType = this.fileData.type;
if (mimeType.match(/image\/*/) == null) {
  return;
}
const reader = new FileReader();
reader.readAsDataURL(this.fileData);
reader.onload = (_event) => {
  this.previewUrl = reader.result;
  this.gymForm.get('logo').setValue(this.fileData.name );
}
this.cdRef.detectChanges(); // angular refresh image view
}



  removeEmpty(object) {
    Object.keys(object).forEach(key => {
      if (object[key] && typeof object[key] === "object")
        this.removeEmpty(object[key]);
      else if (
        object[key] == null ||
        object[key].toString().trim() == "" ||
        object[key] == undefined
      )
        delete object[key];
    });
    return object;
  }





  domToPdf(domElem_id) {
    html2canvas(document.getElementById('' + domElem_id)).then(function(canvas) {
      const img = canvas.toDataURL('image/png');
      const doc = new jsPDF();
    doc.addImage(img, 'JPEG', 5, 20);
    doc.save('div_current_user.pdf');
    });
  }





  onRate($event: { oldValue: number, newValue: number, starRating: StarRatingComponent }) {
    console.log(`Old Value:${$event.oldValue},
New Value: ${$event.newValue},
Checked Color: ${$event.starRating.checkedcolor},
Unchecked Color: ${$event.starRating.uncheckedcolor}`);

   this.currentRate = $event.newValue ;
}



}
