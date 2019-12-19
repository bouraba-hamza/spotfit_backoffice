import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { PartnerService } from "@app/@core/http/partner.service";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import { Partner } from "@app/@core/models/partner";
import { AccountService } from "@app/@core/http/account.service";

@Component({
  selector: "app-partner-list",
  templateUrl: "./partner-list.component.html",
  styleUrls: ["./partner-list.component.scss"]
})
export class PartnerListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    "username",
    "email",
    "email_verified_at",
    "disabled",
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  partners: Partner[];

  constructor(
    private partnerService: PartnerService,
    private route: ActivatedRoute,
    private router: Router,
    private accountService: AccountService
  ) {
    this.route.data
      .pipe(map(data => data["partners"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.partners = this.partnerService.getPartners();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.partnerService.onPartnersChanged.subscribe((data: any) => {
      this.dataSource.data = data;
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }

  onDisableAccount(accountId: number) {
    this.accountService
      .disable(accountId)
      .subscribe(response => this.refresh());
  }

  onActivateAccount(accountId: number) {
    this.accountService
      .enable(accountId)
      .subscribe(response => this.refresh());
  }

  onShowProfile(accountId: number) {
    this.router.navigateByUrl(`/profil/${accountId}`);
  }

  onEdit(partnerId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", partnerId }
    });
  }

  refresh() {
    this.partnerService.findAll().subscribe();
  }
}
