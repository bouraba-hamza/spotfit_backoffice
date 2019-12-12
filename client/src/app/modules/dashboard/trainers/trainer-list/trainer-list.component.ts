import { Component, OnInit, ViewChild, AfterViewInit } from "@angular/core";
import { TrainerService } from "@app/@core/http/trainer.service";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { Sort, MatSort } from "@angular/material/sort";
import { ActivatedRoute, Router } from "@angular/router";
import { map } from "rxjs/operators";
import { Trainer } from "@app/@core/models/trainer";
import { AccountService } from "@app/@core/http/account.service";

@Component({
  selector: "app-trainer-list",
  templateUrl: "./trainer-list.component.html",
  styleUrls: ["./trainer-list.component.scss"]
})
export class TrainerListComponent implements OnInit, AfterViewInit {
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
  trainers: Trainer[];

  constructor(
    private trainerService: TrainerService,
    private route: ActivatedRoute,
    private router: Router,
    private accountService: AccountService
  ) {
    this.route.data
      .pipe(map(data => data["trainers"]))
      .subscribe(
        data => (this.dataSource = new MatTableDataSource<any[]>(data))
      );

    this.trainers = this.trainerService.getTrainers();
  }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;

    this.trainerService.onTrainersChanged.subscribe((data: any) => {
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
      .activate(accountId)
      .subscribe(response => this.refresh());
  }

  onShowProfile(accountId: number) {
    this.router.navigateByUrl(`/profil/${accountId}`);
  }

  onEdit(trainerId: number) {
    this.router.navigate(["form"], {
      relativeTo: this.route,
      queryParams: { action: "edit", trainerId }
    });
  }

  refresh() {
    this.trainerService.findAll().subscribe();
  }
}
