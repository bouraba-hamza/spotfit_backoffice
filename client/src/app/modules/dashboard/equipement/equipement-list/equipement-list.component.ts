

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {EquipementService} from "@app/@core/http/equipement.service";
import {Equipement} from "@app/@core/models/equipement";

@Component({
  selector: "app-equipement-list",
  templateUrl: "./equipement-list.component.html",
  styleUrls: ["./equipement-list.component.scss"]
})
export class EquipementListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "libelle",
 "rate",
 "gym_id", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  equipement: Equipement[];

  constructor(
    private equipementService: EquipementService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["equipement"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.equipement = this.equipementService.getEquipement();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.equipementService.onEquipementChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(equipementId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", equipementId }
    });
  }

  onDelete(equipementId: number) {
    console.log(equipementId);
    this.equipementService.delete(equipementId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.equipementService.findAll().subscribe();
  }
}


 