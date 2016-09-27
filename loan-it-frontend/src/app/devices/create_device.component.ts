import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { ApiService } from '../shared';
import { Router } from '@angular/router';

// import '../style/app.scss';

@Component({
  selector: 'create-device', // <my-app></my-app>
  templateUrl: './create_device.component.html',
  styleUrls: ['./device.component.scss'],
})
export class CreateDeviceComponent implements OnInit {
  all_groups: Device[] = [];

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);
  }

  constructor(private api: ApiService, private router: Router) {
    // Do something with api
  }

  addDevice(name: string, group_id: number) {
    this.api.createDevice(name, group_id)
                     .subscribe(
                       device  => this.all_groups.push(device));
    this.router.navigate(['/devices']);
  }
}
