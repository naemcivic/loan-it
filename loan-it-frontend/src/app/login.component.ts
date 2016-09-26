import { Component } from '@angular/core';
import { Router } from '@angular/router';

import { UserService } from './shared/user.service';

@Component({
    selector: 'login',
    templateUrl: './login.component.html'
})

export class LoginComponent {
    model: any = {};
    constructor(private userService: UserService, private router: Router) { }

    login(email, password) {
        this.userService.login(this.model.email, this.model.password).subscribe((result) => {
            if (result) {
                this.router.navigate(['brokendevices']);
            }
        });
    }
}
