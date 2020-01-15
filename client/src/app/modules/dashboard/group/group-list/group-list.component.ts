

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {GroupService} from "@app/@core/http/group.service";
import {Group} from "@app/@core/models/group";

@Component({
  selector: "app-group-list",
  templateUrl: "./group-list.component.html",
  styleUrls: ["./group-list.component.scss"]
})
export class GroupListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "name",
 "partner_id", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  group: Group[];

  constructor(
    private groupService: GroupService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["group"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.group = this.groupService.getGroup();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.groupService.onGroupChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(groupId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", groupId }
    });
  }

  onDelete(groupId: number) {
    console.log(groupId);
    this.groupService.delete(groupId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.groupService.findAll().subscribe();
  }
}


 