

import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {FactureService} from "@app/@core/http/facture.service";
import {Facture} from "@app/@core/models/facture";

@Component({
  selector: "app-facture-list",
  templateUrl: "./facture-list.component.html",
  styleUrls: ["./facture-list.component.scss"]
})
export class FactureListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "libele",
 "montant", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  facture: Facture[];

  constructor(
    private factureService: FactureService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.route.data
      .pipe(map(data => data["facture"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.facture = this.factureService.getFacture();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.factureService.onFactureChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(factureId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", factureId }
    });
  }

  onDelete(factureId: number) {
    console.log(factureId);
    this.factureService.delete(factureId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.factureService.findAll().subscribe();
  }
}


 