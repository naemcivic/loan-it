import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { User } from '../shared/user';
import { ApiService } from '../shared';
import { Router, ActivatedRoute, Params } from '@angular/router';


// import '../style/app.scss';

@Component({
  selector: 'app-devices', // <my-app></my-app>
  templateUrl: './device.component.html',
  styleUrls: ['./device.component.scss'],
})
export class DeviceComponent implements OnInit {
  all_groups: Device[] = [];

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);
  }

  constructor(private api: ApiService, private router: Router, private route: ActivatedRoute) {
    // Do something with api
  }

  onSelect(device: Device) {
    this.router.navigate(['/device', device.id]);
  }

  createLoan(device: Device) {
    this.router.navigate(['/device/'+ device.id +'/createloan']);
  }

  relinquishLoan(device: Device) {
    this.api.relinquishLoan(device.id, device.loan_id).subscribe(
                       device  => this.all_groups.push(device));;
    this.router.navigate(['/device', device.id]);
  }
}
