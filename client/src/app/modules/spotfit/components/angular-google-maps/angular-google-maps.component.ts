import { Component, OnInit, ViewChild, ElementRef, NgZone } from '@angular/core';
import { MapsAPILoader } from '@agm/core';
// @ts-ignore
import {} from '@types/googlemaps';

@Component({
  selector: 'app-angular-google-maps',
  templateUrl: './angular-google-maps.component.html',
  styleUrls: ['./angular-google-maps.component.scss']
})
export class AngularGoogleMapsComponent implements OnInit {

  lat = 33.568105;
  lng = -7.507919;
  zoom = 16;
  markerDraggable = true;
  locationChosen = false;

  @ViewChild('search', { static: true }) public searchElement: ElementRef;


  constructor(private mapsAPILoader: MapsAPILoader, private ngZone: NgZone) { }

  ngOnInit() {
    this.mapsAPILoader.load().then(
        () => {
          const autocomplete = new google.maps.places.Autocomplete(this.searchElement.nativeElement, { types: ['address'] });

          autocomplete.addListener('place_changed', () => {
            this.ngZone.run(() => {
              const place: google.maps.places.PlaceResult = autocomplete.getPlace();
              if (place.geometry === undefined || place.geometry === null ) {
                return;
              }
            });
          });
        }
    );
  }

  onChooseLocation(event) {
    this.lat = event.coords.lat;
    this.lng = event.coords.lng;
    this.locationChosen = true;
  }

}
