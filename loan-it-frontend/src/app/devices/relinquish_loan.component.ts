import { Component, OnInit } from '@angular/core';
import { Device } from '../shared/device';
import { User } from '../shared/user';
import { ApiService } from '../shared';
import { Router, ActivatedRoute, Params } from '@angular/router';



// import '../style/app.scss';

@Component({
  selector: 'relinquish-loan',
  templateUrl: './relinquish_loan.component.html',
  styleUrls: ['./relinquish_loan.component.scss'],
})
export class RelinquishLoanComponent implements OnInit {
  all_groups: Device[] = [];
  device_id: number;
  loan_id: number;

  ngOnInit() {
    this.api.obtainDevices()
        .subscribe((data: Device[]) => this.all_groups = data);

     this.route.params.forEach((params: Params) => {
     this.device_id = +params['id']; // (+) converts string 'id' to a number
     this.loan_id = +params['loan_id'];
    });
    
  }

  constructor(private api: ApiService, private route: ActivatedRoute, private router: Router) {
    // Do something with api
  }

  relinquishLoan() {
    this.api.relinquishLoan(this.device_id, this.loan_id).subscribe(
                       device  => this.all_groups.push(device));;
    this.router.navigate(['/devices']);
  }

  redirectToDevices() {
    this.router.navigate(['/devices']);
  }
}