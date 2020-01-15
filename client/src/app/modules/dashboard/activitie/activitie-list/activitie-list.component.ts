

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {ActivitieService} from "@app/@core/http/activitie.service";
import {Activitie} from "@app/@core/models/activitie";

@Component({
  selector: "app-activitie-list",
  templateUrl: "./activitie-list.component.html",
  styleUrls: ["./activitie-list.component.scss"]
})
export class ActivitieListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "name",
 "icon", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  activitie: Activitie[];

  constructor(
    private activitieService: ActivitieService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["activitie"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.activitie = this.activitieService.getActivitie();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.activitieService.onActivitieChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(activitieId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", activitieId }
    });
  }

  onDelete(activitieId: number) {
    console.log(activitieId);
    this.activitieService.delete(activitieId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.activitieService.findAll().subscribe();
  }
}


 