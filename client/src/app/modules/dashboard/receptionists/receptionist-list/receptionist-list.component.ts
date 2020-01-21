import {AfterViewInit, Component, OnInit, ViewChild} from "@angular/core";
import {ReceptionistService} from "@app/@core/http/receptionist.service";
import {MatTableDataSource} from "@angular/material/table";
import {MatPaginator} from "@angular/material/paginator";
import {MatSort} from "@angular/material/sort";
import {ActivatedRoute, Router} from "@angular/router";
import {map} from "rxjs/operators";
import {Receptionist} from "@app/@core/models/receptionist";
import {AccountService} from "@app/@core/http/account.service";

@Component({
    selector: "app-receptionist-list",
    templateUrl: "./receptionist-list.component.html",
    styleUrls: ["./receptionist-list.component.scss"]
})
export class ReceptionistListComponent implements OnInit, AfterViewInit {
    displayedColumns: string[] = [
        "username",
        "email",
        "email_verified_at",
        "disabled",
        "actions"
    ];
    dataSource: MatTableDataSource<any[]>;
    @ViewChild(MatSort, {static: true}) sort: MatSort;
    @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
    receptionists: Receptionist[];

    constructor(
        private receptionistService: ReceptionistService,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService
    ) {
        this.route.data
            .pipe(map(data => data["receptionists"]))
            .subscribe(
                data => (this.dataSource = new MatTableDataSource<any[]>(data))
            );

        this.receptionists = this.receptionistService.getReceptionists();
    }

    ngOnInit() {
        this.dataSource.paginator = this.paginator;

        this.receptionistService.onReceptionistsChanged.subscribe((data: any) => {
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
            .enable(accountId)
            .subscribe(response => this.refresh());
    }

    onShowProfile(accountId: number) {
        this.router.navigateByUrl(`/profil/${accountId}`);
    }

    onEdit(receptionistId: number) {
        this.router.navigate(["form"], {
            relativeTo: this.route,
            queryParams: {action: "edit", receptionistId}
        });
    }

    refresh() {
        this.receptionistService.findAll().subscribe();
    }
}
