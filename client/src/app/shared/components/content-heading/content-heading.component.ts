import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'content-heading',
  templateUrl: './content-heading.component.html',
  styleUrls: ['./content-heading.component.scss']
})
export class ContentHeadingComponent implements OnInit {

  @Input()
  icon: String = '';

  @Input()
  heading: String = '-----';

  @Input()
  subHeading: String = '-----';

  constructor() { }

  ngOnInit() {
  }

}
