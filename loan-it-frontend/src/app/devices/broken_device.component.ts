import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { ApiService } from '../shared';

// import '../style/app.scss';

@Component({
  selector: 'broken-device', //
  templateUrl: './broken_device.component.html',
  styleUrls: ['./device.component.scss'],
})
export class BrokenDeviceComponent implements OnInit {
  all_groups: Device[] = [];

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);
  }

  constructor(private api: ApiService) {
    // Do something with api
  }

}
