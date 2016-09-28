import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { User } from '../shared/user';
import { ApiService } from '../shared';
import { Router, ActivatedRoute, Params } from '@angular/router';



// import '../style/app.scss';

@Component({
  selector: 'create-loan',
  templateUrl: './create_loan.component.html',
  styleUrls: ['./device.component.scss'],
})
export class CreateLoanComponent implements OnInit {
  all_groups: Device[] = [];
  all_users: User[] = [];
  device_id: number;

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);

    this.api.obtainUsers()
        .subscribe((data: User[]) => this.all_users = data);

    this.route.params.forEach((params: Params) => {
     this.device_id = +params['id']; // (+) converts string 'id' to a number
    });
  }

  constructor(private api: ApiService, private route: ActivatedRoute, private router: Router) {
    // Do something with api
  }

  addLoan(signature: string, user_id: number) {
    this.api.createLoan(this.device_id, signature, user_id)
                     .subscribe(
                       device  => this.all_groups.push(device));
    this.router.navigate(['/devices']);
  }



}