import { Component, OnInit, ViewChild, ElementRef, NgZone } from '@angular/core';
import { MapsAPILoader } from '@agm/core';
// @ts-ignore
import {} from '@types/googlemaps';
import {FormControl} from '@angular/forms';

@Component({
  selector: 'app-angular-google-maps',
  templateUrl: './angular-google-maps.component.html',
  styleUrls: ['./angular-google-maps.component.scss']
})
export class AngularGoogleMapsComponent implements OnInit {

  currentRate = 1;
  gpsEnabled = false;
  // filters
  filters = [
    { label: 'gym', label_fr: "gyms", class: 'gradient-pomegranate', icon: "ft-crosshair" },
    { label: 'activity', label_fr: "activités", class: ' gradient-purple-bliss', icon: "ft-activity" },
    { label: 'coach', label_fr: "entraîneurs", class: 'gradient-mint', icon: "ft-check-circle" },
    { label: 'stars', label_fr: "gamme", class: ' gradient-ibiza-sunset', icon: "ft-star" },
    { label: 'location', label_fr: "localisation", class: 'gradient-nepal whit', icon: "ft-flag" },
  ];

  selectedFilter = 'gym';

  markerIconDefault = "assets/icons/map-marker-1.png";

  // geometry attributes of MOROCCO
  lat: number;
  lng: number;

  zoom = 14;
  markerDraggable = true;
  locationChosen = false;
  markers: any = [];
  searchControl: FormControl;
  visitor: { lat: number, lng: number };

  @ViewChild('search', { static: true }) public searchElement: ElementRef;


  constructor(private mapsAPILoader: MapsAPILoader, private ngZone: NgZone) {
    this.searchControl = new FormControl();
    this.lat = this.gyms[0].address.lat;
    this.lng = this.gyms[0].address.lng;
    this.markers = this.gyms;
  }

  ngOnInit() {

    this.mapsAPILoader.load().then(
        () => {
          const autocomplete = new google.maps.places.Autocomplete(
              this.searchElement.nativeElement,
              { types: [], componentRestrictions: { 'country': 'MA' } });

          autocomplete.addListener('place_changed', () => {
            this.ngZone.run(() => {
              const place: google.maps.places.PlaceResult = autocomplete.getPlace();
              if (place.geometry === undefined || place.geometry === null ) {
                return;
              }

              const location = {
                lat: place.geometry.location.lat(),
                lng: place.geometry.location.lng(),
              }

              // set positon on the map
              this.setPosition(location.lat, location.lng);

              // set position's markers
              this.markers.push(location);

              // empty the search input
              this.searchControl.reset();

            });
          });
        }
    );
  }

  private setCurrentLocationOnMap() {
    if ('geolocation' in navigator) {
      navigator.geolocation.getCurrentPosition( position => {
        this.visitor = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        }
        this.setPosition(this.visitor.lat, this.visitor.lng);
        this.zoom = 14;
      })
    }
  }

  // onChooseLocation(event) {
  //   this.lat = event.coords.lat;
  //   this.lng = event.coords.lng;
  //   this.locationChosen = true;
  // }

  private setPosition(lat, lng) {
    this.lat = lat;
    this.lng = lng;
  }


  clickedMarker(label: string, index: number) {
    // alert(`clicked the marker: ${label || index}`)
  }

  onChooseFilter(filter: string) {
    if(filter === 'location') {
      this.setCurrentLocationOnMap();
      this.selectedFilter = 'location';
    } else {
      // reset markers
      this.markers = this.gyms;
      this.selectedFilter = this.filters.find(f => f.label === filter).label;
    }
  }

  onSelectActivity(activities: {id: number, name: string}[]) {
    // we have an array of activities
    // we should filter gyms based on passed activities

    let ids = [];
    activities.forEach(activity => {
      ids.push(activity.id);
    })

    this.markers = this.gyms.filter(gym => ids.includes(gym.activity_id));
  }

  onSelectCoach(coaches: {id: number, fullname: string}[]) {
    let ids = [];
    coaches.forEach(activity => {
      ids.push(activity.id);
    })

    this.markers = this.gyms.filter(gym => ids.includes(gym.coach_id));
  }

  onRateChange(rate)  {
    this.markers = this.gyms.filter(gym => gym.stars == rate);
  }

  reset() {
    this.markers = this.gyms;
  }

  /*onSelectStars(stars: number) {
    this.markers = this.gyms.filter(gym => gym.stars == stars);
  }*/

  onSelectGym(gyms: {}[]) {
    this.markers = gyms;
  }

  // gyms
  gyms = [
    { name: "Gym1", address: { lat: 33.6085969, lng: -7.6244165}, logo: "assets/icons/gym1.png", activity_id: 4, coach_id: 1, stars: 3},
    { name: "Gym3", address: { lat: 33.60840945, lng: -7.62346158}, logo: "assets/icons/gym2.png", activity_id: 8, coach_id: 3, stars: 4},
    { name: "Gym4", address: { lat: 33.60592533, lng: -7.62283524}, logo:  "assets/icons/gym3.png", activity_id: 7, coach_id: 3, stars: 3},
    { name: "Gym8", address: { lat: 33.59574833, lng: -7.59766488}, logo:"assets/icons/gym1.png", activity_id: 7, coach_id: 4, stars: 5},
    { name: "Gym9", address: { lat: 33.61416799, lng: -7.55374872}, logo: null, activity_id: 11, coach_id: 9, stars: 5},
    { name: "Gym10", address: { lat: 33.61253798, lng: -7.59840514}, logo: "assets/icons/gym4.png", activity_id: 11, coach_id: 4, stars: 5},
  ];

  // coach, coach_id: 1es
  coaches = [
    { id: 1, fullname: "C1"},
    { id: 3, fullname: "C3"},
    { id: 4, fullname: "C4"},
    { id: 8, fullname: "C8"},
    { id: 9, fullname: "C9"},
    { id: 10, fullname: "C10"},
  ];

  // activities
  activities = [
    { id: 4, name: "A4"},
    { id: 8, name: "A8"},
    { id: 7, name: "A7"},
    { id: 11, name: "A11"},
  ];


}
