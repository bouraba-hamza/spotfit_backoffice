import {Component, HostListener, Input, OnInit} from '@angular/core';
import {Subscription} from "@app/@core/models/subscription";

@Component({
  selector: 'app-subscription-card',
  templateUrl: './subscription-card.component.html',
  styleUrls: ['./subscription-card.component.scss']
})
export class SubscriptionCardComponent implements OnInit {

  linearGradient = "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(255,255,255,1) 5%, rgba(255,255,255,0) 78%)";
  constructor() {
    this.innerWidth = window.innerWidth;
  }

  @Input()
  subscription: Subscription;

  ngOnInit() {

  }

  public innerWidth: any;

  @HostListener('window:resize', ['$event'])

  onResize(event) {
    this.innerWidth = window.innerWidth;
  }
}
