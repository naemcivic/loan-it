import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { ApiService } from '../shared';

// import '../style/app.scss';

@Component({
  selector: 'create-loan', // <my-app></my-app>
  templateUrl: './create_loan.component.html',
  styleUrls: ['./device.component.scss'],
})
export class CreateLoanComponent implements OnInit {
  all_groups: Device[] = [];

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);
  }

  constructor(private api: ApiService) {
    // Do something with api
  }

  addLoan(device, signature: string, user_id: number) {
    if (!name) { return; }
    this.api.createLoan(device, signature, user_id)
                     .subscribe(
                       device  => this.all_groups.push(device);
  }
}
