import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { AdminService } from "@app/@core/http/admin.service";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import { Admin } from "@app/@core/models/admin";
import { AccountService } from "@app/@core/http/account.service";

@Component({
  selector: "app-admin-list",
  templateUrl: "./admin-list.component.html",
  styleUrls: ["./admin-list.component.scss"]
})
export class AdminListComponent implements OnInit, AfterViewInit {
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
  admins: Admin[];

  constructor(
    private adminService: AdminService,
    private route: ActivatedRoute,
    private router: Router,
    private accountService: AccountService
  ) {
    this.route.data
      .pipe(map(data => data["admins"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.admins = this.adminService.getAdmins();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.adminService.onAdminsChanged.subscribe((data: any) => {
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
      .activate(accountId)
      .subscribe(response => this.refresh());
  }

  onShowProfile(accountId: number) {
    this.router.navigateByUrl(`/profil/${accountId}`);
  }

  onEdit(adminId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", adminId }
    });
  }

  refresh() {
    this.adminService.findAll().subscribe();
  }
}
