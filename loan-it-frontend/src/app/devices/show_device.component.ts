import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { ApiService } from '../shared';
import { Router, ActivatedRoute, Params } from '@angular/router';


// import '../style/app.scss';

@Component({
  selector: 'show-device', // <my-app></my-app>
  templateUrl: './show_device.component.html',
  styleUrls: ['./device.component.scss'],
})
export class ShowDeviceComponent implements OnInit {
  all_groups: Device[] = [];
  device: Device;

  ngOnInit() {
    this.route.params.forEach((params: Params) => {
     let device_id = +params['id']; // (+) converts string 'id' to a number
     this.api.showDevice(device_id).subscribe(result => this.device = result);
   });
  }

  constructor(private api: ApiService, private route: ActivatedRoute, private router: Router) {
    // Do something with api
  }
}
