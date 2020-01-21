import {Component, OnInit, ViewChild, AfterViewInit} from "@angular/core";
import {PartnerService} from "@app/@core/http/partner.service";
import {MatTableDataSource} from "@angular/material/table";
import {MatPaginator} from "@angular/material/paginator";
import {Sort, MatSort} from "@angular/material/sort";
import {ActivatedRoute, Router} from "@angular/router";
import {map} from "rxjs/operators";
import {Class} from "@app/@core/models/class";
import {ClassService} from "@app/@core/http/class.service";

@Component({
    selector: "app-partner-list",
    templateUrl: "./class-list.component.html",
    styleUrls: ["./class-list.component.scss"]
})
export class ClassListComponent implements OnInit, AfterViewInit {
    displayedColumns: string[] = [
        "name",
        "image",
        "prix_min",
        "prix_max",
        "actions"
    ];
    dataSource: MatTableDataSource<any[]>;
    @ViewChild(MatSort, {static: true}) sort: MatSort;
    @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
    class: Class[];

    constructor(
        private classService: ClassService,
        private route: ActivatedRoute,
        private router: Router,
    ) {
        this.route.data
            .pipe(map(data => data["class"]))
            .subscribe(
                data => (this.dataSource = new MatTableDataSource<any[]>(data))
            );

        this.class = this.classService.getClass();
    }

    ngOnInit() {
        this.dataSource.paginator = this.paginator;

        this.classService.onClassChanged.subscribe((data: any) => {
            this.dataSource.data = data;
            console.log(this.dataSource.data);
        });
    }

    ngAfterViewInit() {
        this.dataSource.sort = this.sort;
    }


    onEdit(classId: number) {
        this.router.navigate(["form"], {
            relativeTo: this.route,
            queryParams: {action: "edit", classId}
        });
    }

    onDelete(partnerId: number) {
        console.log(partnerId);
    }

    refresh() {
        this.classService.findAll().subscribe();
    }
}
