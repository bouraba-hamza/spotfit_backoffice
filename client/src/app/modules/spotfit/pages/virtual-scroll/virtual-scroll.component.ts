import { Component, OnInit } from '@angular/core';
import {ArtistsService} from "@app/modules/spotfit/pages/virtual-scroll/artists.service";

@Component({
  selector: 'app-virtual-scroll',
  templateUrl: './virtual-scroll.component.html',
  styleUrls: ['./virtual-scroll.component.scss']
})
export class VirtualScrollComponent implements OnInit {

  constructor(private artistsService: ArtistsService) { }

  artists = [];
  ngOnInit() {
    this.getArtists();
  }
  getArtists (){
    this.artists = this.artistsService.getArtists();
  }

}
