import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import {GymService} from "@app/@core/http/gym.service";
import {Gym} from "@app/@core/models/gym";

import { StarRatingComponent } from 'ng-starrating';

@Component({
  selector: "app-gym-list",
  templateUrl: "./gym-list.component.html",
  styleUrls: ["./gym-list.component.scss"]
})
export class GymListComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    
 "logo",
 "qrcode",
 "name",
 "rate",
 "group_id",
 "class_id",
 "facilities",
 "planning", 
    "actions"
  ];
  dataSource: MatTableDataSource<any[]>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  gym: Gym[];
  public gymAngularxQrCode: string = null;
  public currentRate: Number; 

 
  constructor(
    private gymService: GymService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    this.gymAngularxQrCode = 'initials Gyms QR code';

    this.route.data
      .pipe(map(data => data["gym"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.gym = this.gymService.getGym();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.gymService.onGymChanged.subscribe((data: any) => {
      this.dataSource.data = data;
      console.log(this.dataSource.data);
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }


  onEdit(gymId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", gymId }
    });
  }

  onDelete(gymId: number) {
    console.log(gymId);
    this.gymService.delete(gymId).subscribe((data: any) => {
      this.refresh();
    });
  }

  refresh() {
    this.gymService.findAll().subscribe();
  }


  


  onRate($event: { oldValue: number, newValue: number, starRating: StarRatingComponent }) {
    console.log(`Old Value:${$event.oldValue},
New Value: ${$event.newValue},
Checked Color: ${$event.starRating.checkedcolor},
Unchecked Color: ${$event.starRating.uncheckedcolor}`);

   this.currentRate = $event.newValue ;
}


}


 