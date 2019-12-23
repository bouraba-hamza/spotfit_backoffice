import { Injectable } from '@angular/core';
import {datasource} from "@app/modules/spotfit/pages/virtual-scroll/data";

@Injectable({
  providedIn: 'root'
})
export class ArtistsService {

  constructor() { }

  getArtists() {
    return datasource;
  }
}
