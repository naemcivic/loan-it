import { Injectable }    from '@angular/core';
import { RequestOptions, Headers, Http, Response } from '@angular/http';
import { Device } from './device';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class ApiService {

  private headers = new Headers({'Content-Type': 'application/json'});

  private GROUP_URL = 'http://localhost:3000/api/groups';
  private DEVICE_CREATION_URL = 'http://localhost:3000/api/devices';
  // private LOAN_CREATION_URL = 'localhost:3000/api/devices/{{device.id}}/loans';


  constructor(private http: Http) { }

    private extractData(res: Response) {
      let body = res.json();
      return body.data || { };
    }

    obtainDevices(): Observable<Device[]> {
    return this.http.get(this.GROUP_URL)
               .map((resp: Response) => resp.json())
               .catch(this.handleError);
    }

    showDevice(id: number): Observable<Device> {
    return this.http.get(`http://localhost:3000/api/devices/${id}`)
               .map((resp: Response) => resp.json())
               .catch(this.handleError);
    }

    createDevice (name: string, group_id: number): Observable<Device> {
      let body = JSON.stringify({ name, group_id });
      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });

      return this.http.post(this.DEVICE_CREATION_URL, body, options)
                      .map(this.extractData)
                      .catch(this.handleError);
    }

    // createLoan (signature: string, user_id: number): Observable<Device> {
    //   let body = JSON.stringify({ signature, user_id });
    //   let headers = new Headers({ 'Content-Type': 'application/json' });
    //   let options = new RequestOptions({ headers: headers });

    //   return this.http.post(this.LOAN_CREATION_URL, body, options)
    //                   .map(this.extractData)
    //                   .catch(this.handleError);
    // }

    createLoan(device, signature: string, user_id: number) {
      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = JSON.stringify({signature, user_id});
      return this.http.put('/api/devices/' + device.id + '/loans', body, headers).map((res: Response) => res.json());
  }

    handleError(error: any) {
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }
}
