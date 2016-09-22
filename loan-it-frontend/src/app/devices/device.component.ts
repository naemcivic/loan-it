import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { ApiService } from '../shared';

// import '../style/app.scss';

@Component({
  selector: 'app-devices', // <my-app></my-app>
  templateUrl: './device.component.html',
  styleUrls: ['./device.component.scss'],
})
export class DeviceComponent implements OnInit {

  all_devices: Device[] = [];
  constructor(private api: ApiService) {
    // Do something with api
  }

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_devices = data);
  }

}
