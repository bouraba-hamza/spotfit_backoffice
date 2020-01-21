

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {FacilitieService} from "@app/@core/http/facilitie.service";
import {Facilitie} from "@app/@core/models/facilitie";

@Component({
  selector: "app-facilitie-list",
  templateUrl: "./facilitie-list.component.html",
  styleUrls: ["./facilitie-list.component.scss"]
})
export class FacilitieListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "icon",
 "name",
 "order", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  facilitie: Facilitie[];

  constructor(
    private facilitieService: FacilitieService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["facilitie"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.facilitie = this.facilitieService.getFacilitie();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.facilitieService.onFacilitieChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(facilitieId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", facilitieId }
    });
  }

  onDelete(facilitieId: number) {
    console.log(facilitieId);
    this.facilitieService.delete(facilitieId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.facilitieService.findAll().subscribe();
  }
}


 