import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { PartnerService } from "@app/@core/http/partner.service";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import { Partner } from "@app/@core/models/partner";
import { AccountService } from "@app/@core/http/account.service";
import {PassService} from "@app/@core/http/pass.service";
import {Pass} from "@app/@core/models/pass";

@Component({
  selector: "app-partner-list",
  templateUrl: "./pass-list.component.html",
  styleUrls: ["./pass-list.component.scss"]
})
export class PassListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    "name",
    "duration",
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  pass: Pass[];

  constructor(
    private passService: PassService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["pass"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.pass = this.passService.getPass();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.passService.onPassChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(passId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", passId }
    });
  }
  onDelete(partnerId: number) {
    console.log(partnerId);
  }

  refresh() {
    this.passService.findAll().subscribe();
  }
}
