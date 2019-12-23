import { Component, OnInit } from '@angular/core';
import {SettingService} from "@app/@core/http/setting.service";
import {Setting} from "@app/@core/models/setting";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-settings-overview',
  templateUrl: './settings-overview.component.html',
  styleUrls: ['./settings-overview.component.scss'],
  providers: [ToastrService]
})
export class SettingsOverviewComponent implements OnInit {

  settings: Setting[];

  sponsorshipRate: any;
  ambassadorSponsorshipRate: any;

  constructor(
      private settingService: SettingService,
      private toastr: ToastrService,
  ) { }

  ngOnInit() {
    this.settingService.onSettingsChanged.subscribe(settings => this.settings = settings);

    this.sponsorshipRate = this.valueOf("sponsorship-rate");
    this.ambassadorSponsorshipRate = this.valueOf("ambassador-sponsorship-rate");
  }

  valueOf(key: string) {
    return this.settings.find((setting: Setting) => setting.key == key).value;
  }

  onChange($event) {
    // eluminate empty values
    if($event.target.value === "")
      return;

    // submit the form
    this.settingService.update($event.target.id, { value: $event.target.value }).subscribe(
        reponse => {
          this.toastr.success(
              `Le paramètre "${reponse.key.toUpperCase()}" a été modifié à "${reponse.value}"`,
              "Paramètres",
              { timeOut: 5000 }
          );
        }
    );
  }
}
