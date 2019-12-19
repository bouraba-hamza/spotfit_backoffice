import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { CustomerService } from "@app/@core/http/customer.service";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import { Customer } from "@app/@core/models/customer";
import { AccountService } from "@app/@core/http/account.service";

@Component({
  selector: "app-customer-list",
  templateUrl: "./customer-list.component.html",
  styleUrls: ["./customer-list.component.scss"]
})
export class CustomerListComponent implements OnInit, AfterViewInit {
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
  customers: Customer[];

  constructor(
    private customerService: CustomerService,
    private route: ActivatedRoute,
    private router: Router,
    private accountService: AccountService
  ) {
    this.route.data
      .pipe(map(data => data["customers"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.customers = this.customerService.getCustomers();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.customerService.onCustomersChanged.subscribe((data: any) => {
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

  onEdit(customerId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", customerId }
    });
  }

  refresh() {
    this.customerService.findAll().subscribe();
  }
}
