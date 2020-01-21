

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {Base64ToPngService} from "@app/@core/http/base64ToPng.service";
import {Base64ToPng} from "@app/@core/models/base64ToPng";

@Component({
  selector: "app-base64ToPng-list",
  templateUrl: "./base64ToPng-list.component.html",
  styleUrls: ["./base64ToPng-list.component.scss"]
})
export class Base64ToPngListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "name",
 "code", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  base64ToPng: Base64ToPng[];

  constructor(
    private base64ToPngService: Base64ToPngService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["base64ToPng"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.base64ToPng = this.base64ToPngService.getBase64ToPng();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.base64ToPngService.onBase64ToPngChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(base64ToPngId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", base64ToPngId }
    });
  }

  onDelete(base64ToPngId: number) {
    console.log(base64ToPngId);
    this.base64ToPngService.delete(base64ToPngId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.base64ToPngService.findAll().subscribe();
  }
}


 