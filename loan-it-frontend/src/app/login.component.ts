import { Component } from '@angular/core';
import { Router } from '@angular/router';

import { UserService } from './shared/user.service';

@Component({
    selector: 'login',
    tempplate: `...`
})

export class LoginComponent {
    constructor(private userService: UserService, private router: Router) {}

    onSumbit(email, password) {
        this.userService.login(email, password).subscribe((result) => {
            if (result) {
                this.router.navigate(['']);
            } 
        });
    }
}