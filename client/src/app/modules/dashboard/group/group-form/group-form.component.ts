import {Component, OnInit} from "@angular/core";
import {Router, ActivatedRoute} from "@angular/router";
import {Group} from "@app/@core/models/group";
import {FormGroup, FormBuilder} from "@angular/forms";
import {GroupService} from "@app/@core/http/group.service";
import {ToastrService} from "ngx-toastr";
import {map} from "rxjs/operators";
import {UnderscoreService} from '@app/@core/services/underscore.service';

@Component({
    selector: "app-group-form",
    templateUrl: "./group-form.component.html",
    styleUrls: ["./group-form.component.scss"],
    providers: [ToastrService]
})
export class GroupFormComponent implements OnInit {
    heading: string;
    type: string;
    group: Group;
    partners: any;
    selectedPartner: any;
    groupForm: FormGroup;
    inProgress: boolean = false;

    constructor(
        private router: Router,
        private route: ActivatedRoute,
        private fb: FormBuilder,
        private groupService: GroupService,
        private toastr: ToastrService,
        private underscore: UnderscoreService
    ) {
        this.type = this.route.snapshot.queryParamMap.get("action");

        if (this.type == "add") {
            this.heading = "L'ajout du group";
            this.groupForm = this.createAddForm();
        } else {
            this.heading = "La modification du group";
            this.route.data
                .pipe(map(data => data.group))
                .subscribe((group: Group) => {
                    this.group = group;
                    console.log(this.group);
                    this.groupForm = this.createEditForm(this.group);
                });
        }
    }

    ngOnInit() {

        this.getPartner();
    }


    getPartner() {
       this.groupService.getPartner().subscribe(Partners => {
            console.log(Partners);
            this.partners = Partners;
            this.selectedPartner = Partners;
        });
    }

    searchPartner(event:any)
    {
        let provider=event.target.value;
        const regext=new RegExp(`(\w)?${provider}(\w+)?`,'i');
        if(provider!="")
        {
            this.selectedPartner=this.selectedPartner.filter(partnerData=>regext.test(partnerData.lastName));
        }
        else
            this.selectedPartner=this.partners;
    }

    onCancel(): void {
        this.router.navigate(["../"], {relativeTo: this.route});
    }

    onSubmit() {
        let formValues = this.removeEmpty(Object.assign({}, this.groupForm.value));
        let formData: FormData = this.underscore.convertJsontoFormData(formValues);
        console.log(formData);


        this.inProgress = true;

        if (this.type == "add") {
            this.groupService.add(formData).subscribe((response: any) => {
                if (response.group_id !== undefined && response.group_id > 0) {
                    this.toastr.success(
                        `le group a été ajouter avec succès avec ID: ${response.group_id}`,
                        this.heading,
                        {timeOut: 5000}
                    );
                    this.router.navigate(["../"], {relativeTo: this.route});
                } else {
                    this.toastr.error(`${response.errors[0]}`, this.heading, {
                        closeButton: true
                    });
                }
            }, (error) => {
                console.error(error)
            }, () => {
                this.inProgress = false;
            });
        } else {
            this.groupService.edit(formData, this.group.id)
                .subscribe((response: any) => {
                    if (response.group_id !== undefined && response.group_id > 0) {
                        this.toastr.success(
                            `le group a été modifier avec succès`,
                            this.heading,
                            {timeOut: 5000}
                        );
                        this.router.navigate(["../"], {relativeTo: this.route});
                    } else {
                        this.toastr.error(`${response.errors[0]}`, this.heading, {
                            closeButton: true
                        });
                    }
                }, (error) => {
                    console.error(error)
                }, () => {
                    this.inProgress = false;
                });
        }
    }


    createAddForm() {
        return this.groupForm = this.fb.group({
            name: [null],
            partner_id: [null],
        });
    }

    createEditForm(group: Group) {
        return this.groupForm = this.fb.group({
            name: [group.name],
            partner_id: [group.partner_id],
        });
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


