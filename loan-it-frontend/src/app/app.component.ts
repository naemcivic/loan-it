import { Component, OnInit } from '@angular/core';
import { Device } from './shared/device';
import { ApiService } from './shared';

import '../style/app.scss';

@Component({
  selector: 'my-app', // <my-app></my-app>
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  url = 'https://github.com/preboot/angular2-webpack';
  all_devices: Device[] = [];
  constructor(private api: ApiService) {
    // Do something with api
  }

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_devices = data);
  }

}
