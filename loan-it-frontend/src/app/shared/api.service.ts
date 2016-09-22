import { Injectable }    from '@angular/core';
import { Http, Response } from '@angular/http';
import { Device } from './device';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class ApiService {

  private Url = 'http://localhost:3000/api/devices.json';  // URL to web api

  constructor(private http: Http) { }

    obtainDevices(): Observable<Device[]> {
    return this.http.get(this.Url)
               .map((resp: Response) => resp.json())
               .catch(this.handleError);
    }

    handleError(error: any) {
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }
}
