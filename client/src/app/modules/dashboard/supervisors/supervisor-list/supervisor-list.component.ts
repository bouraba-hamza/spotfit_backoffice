import {AfterViewInit, Component, OnInit, ViewChild} from "@angular/core";
import {SupervisorService} from "@app/@core/http/supervisor.service";
import {MatTableDataSource} from "@angular/material/table";
import {MatPaginator} from "@angular/material/paginator";
import {MatSort} from "@angular/material/sort";
import {ActivatedRoute, Router} from "@angular/router";
import {map} from "rxjs/operators";
import {Supervisor} from "@app/@core/models/supervisor";
import {AccountService} from "@app/@core/http/account.service";

@Component({
    selector: "app-supervisor-list",
    templateUrl: "./supervisor-list.component.html",
    styleUrls: ["./supervisor-list.component.scss"]
})
export class SupervisorListComponent implements OnInit, AfterViewInit {
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
    supervisors: Supervisor[];

    constructor(
        private supervisorService: SupervisorService,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService
    ) {
        this.route.data
            .pipe(map(data => data["supervisors"]))
            .subscribe(
                data => (this.dataSource = new MatTableDataSource<any[]>(data))
            );

        this.supervisors = this.supervisorService.getSupervisors();
    }

    ngOnInit() {
        this.dataSource.paginator = this.paginator;

        this.supervisorService.onSupervisorsChanged.subscribe((data: any) => {
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

    onEdit(supervisorId: number) {
        this.router.navigate(["form"], {
            relativeTo: this.route,
            queryParams: {action: "edit", supervisorId}
        });
    }

    refresh() {
        this.supervisorService.findAll().subscribe();
    }
}
