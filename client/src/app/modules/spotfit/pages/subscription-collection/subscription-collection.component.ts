import {Component, OnInit} from '@angular/core';
import {Subscription} from "@app/@core/models/subscription";

@Component({
    selector: 'app-subscription-collection',
    templateUrl: './subscription-collection.component.html',
    styleUrls: ['./subscription-collection.component.scss']
})
export class SubscriptionCollectionComponent implements OnInit {
    subscriptions: Subscription[] = [
        {
            id: 1,
            name: "daily",
            duration: "24 hour",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing.",
            features: [
                "Lorem ipsum dolor.",
                "Amet beatae consequatur?",
                "Sit amet, consectetur adipisicing.",
            ],
            icon: "hour.svg",
        },
        {
            id: 2,
            name: "monthly",
            duration: "30 jour",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing.",
            features: [
                "Lorem ipsum dolor.",
                "Amet beatae consequatur?",
                "Sit amet, consectetur adipisicing.",
            ],
            icon: "month.svg",
        },
        {
            id: 3,
            name: "yearly",
            duration: "12 month",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing.",
            features: [
                "Lorem ipsum dolor.",
                "Amet beatae consequatur?",
                "Sit amet, consectetur adipisicing.",
            ],
            icon: "year.svg",
        }
    ];


    constructor() {
    }


    ngOnInit() {

    }

}
