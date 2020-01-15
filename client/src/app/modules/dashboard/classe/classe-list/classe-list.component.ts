

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {ClasseService} from "@app/@core/http/classe.service";
import {Classe} from "@app/@core/models/classe";

@Component({
  selector: "app-classe-list",
  templateUrl: "./classe-list.component.html",
  styleUrls: ["./classe-list.component.scss"]
})
export class ClasseListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "name",
 "image",
 "prix_min",
 "prix_max", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  classe: Classe[];

  constructor(
    private classeService: ClasseService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["classe"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.classe = this.classeService.getClasse();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.classeService.onClasseChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(classeId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", classeId }
    });
  }

  onDelete(classeId: number) {
    console.log(classeId);
    this.classeService.delete(classeId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.classeService.findAll().subscribe();
  }
}


 