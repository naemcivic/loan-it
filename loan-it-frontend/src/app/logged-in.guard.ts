import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { UserService } from './shared/user.service';

import { Router } from '@angular/router';


@Injectable()
export class LoggedInGuard implements CanActivate {
    constructor(private user: UserService, private router: Router) {}

    canActivate() {
          if (this.user.isLoggedIn()) {
            return true;
        } else
        {
            this.router.navigate(['/login'])
            return false;
        }
    }
}
