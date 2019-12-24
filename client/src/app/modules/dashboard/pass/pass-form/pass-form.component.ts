import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { Pass } from "@app/@core/models/pass";
import { FormGroup, FormBuilder } from "@angular/forms";
import { PassService } from "@app/@core/http/pass.service";
import { ToastrService } from "ngx-toastr";
import { map } from "rxjs/operators";
import { UnderscoreService } from '@app/@core/services/underscore.service';

@Component({
  selector: "app-pass-form",
  templateUrl: "./pass-form.component.html",
  styleUrls: ["./pass-form.component.scss"],
  providers: [ToastrService]
})
export class PassFormComponent implements OnInit {
  heading: string;
  type: string;
  pass: Pass;
  passForm: FormGroup;
  inProgress: boolean = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private passService: PassService,
    private toastr: ToastrService,
    private underscore: UnderscoreService
  ) {
    this.type = this.route.snapshot.queryParamMap.get("action");

    if (this.type == "add") {
      this.heading = "L'ajout du pass";
      this.passForm = this.createAddForm();
    } else {
      this.heading = "La modification du pass";
      this.route.data
        .pipe(map(data => data.pass))
        .subscribe((pass: Pass) => {
          this.pass = pass;
          console.log(this.pass);
          this.passForm = this.createEditForm(this.pass);
        });
    }
  }

  ngOnInit() {}

  onCancel(): void {
    this.router.navigate(["../"], { relativeTo: this.route });
  }

  onSubmit() {
    let formValues = this.removeEmpty(Object.assign({}, this.passForm.value));
    let formData: FormData = this.underscore.convertJsontoFormData(formValues);

    let photo: any = document.querySelector('#image ');

    let files = photo.files;

    let fileList: FileList = files;


    if (fileList.length > 0) {
      let file: File = fileList[0];
      formData.append('image', file, file.name);
    }
    console.log(formData);


    this.inProgress = true;

    if (this.type == "add") {
      this.passService.add(formData).subscribe((response: any) => {
        if (response.pass_id !== undefined && response.pass_id > 0) {
          this.toastr.success(
              `le pass a été ajouter avec succès avec ID: ${response.pass_id}`,
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
      this.passService.edit(formData, this.pass.id)
          .subscribe((response: any) => {
            if (response.pass_id !== undefined && response.pass_id > 0) {
              this.toastr.success(
                  `le pass a été modifier avec succès`,
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
    return this.fb.group({
      name: [null],
      duration: [null],
      image: [null],

    });
  }

  createEditForm(pass: Pass) {
    return this.fb.group({
      name: [pass.name],
      duration: [pass.duration],
      image: [null],

    });
  }

  setAvatar(avatar: any) {
    console.log(avatar);
    try {
      this.passForm.patchValue({
        avatar
      });
    } catch (e) {
      console.log(e);
    }
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


}
