import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { User } from '../shared/user';
import { ApiService } from '../shared';


// import '../style/app.scss';

@Component({
  selector: 'create-loan',
  templateUrl: './create_loan.component.html',
  styleUrls: ['./device.component.scss'],
})
export class CreateLoanComponent implements OnInit {
  all_groups: Device[] = [];
  all_users: User[] = [];

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);

    this.api.obtainUsers()
        .subscribe((data: User[]) => this.all_users = data);
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
