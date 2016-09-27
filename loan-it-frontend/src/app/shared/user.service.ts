import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import { Router } from '@angular/router';

@Injectable()
export class UserService {
    private loggedIn = false;

    constructor(private http: Http, private router: Router) {
        this.loggedIn = !!localStorage.getItem('auth_token');
    }

    userLogin(email, password) {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');

        return this.http
            .post(
                'http://localhost:3000/users/sign_in',
                JSON.stringify({ email, password }),
                { headers }
            )
            .map(res => res.json())
            .map((res) => {
                if (res.success) {
                    localStorage.setItem('auth_token', res.auth_token);
                    localStorage.setItem('user_name', res.user_name);
                    this.loggedIn = true;
            }
                return res.success;
            });
    }

    logOut() {
        localStorage.clear();
        this.loggedIn = false;
        this.router.navigate(['login']);
    }


    isLoggedIn() {
        return this.loggedIn;
    }
}
