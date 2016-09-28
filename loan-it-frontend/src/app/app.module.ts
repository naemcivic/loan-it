import './rxjs-extensions';

import { NgModule, ApplicationRef } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { DeviceComponent } from './devices/device.component';
import { BrokenDeviceComponent } from './devices/broken_device.component';
import { CreateDeviceComponent } from './devices/create_device.component';
import { CreateLoanComponent } from './devices/create_loan.component';
import { ShowDeviceComponent } from './devices/show_device.component';
import { RelinquishLoanComponent } from './devices/relinquish_loan.component';


import { LoginComponent } from './login.component';

import { LoggedInGuard } from './logged-in.guard';
import { ApiService, UserService } from './shared';

import { routing } from './app.routing';

import { removeNgStyles, createNewHosts } from '@angularclass/hmr';

@NgModule({
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    routing
  ],
  declarations: [
    AppComponent,
    DeviceComponent,
    BrokenDeviceComponent,
    LoginComponent,
    CreateDeviceComponent,
    CreateLoanComponent,
    ShowDeviceComponent,
    RelinquishLoanComponent
  ],
  providers: [
    ApiService, LoggedInGuard, UserService
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(public appRef: ApplicationRef) {}
  hmrOnInit(store) {
    console.log('HMR store', store);
  }
  hmrOnDestroy(store) {
    let cmpLocation = this.appRef.components.map(cmp => cmp.location.nativeElement);
    // recreate elements
    store.disposeOldHosts = createNewHosts(cmpLocation);
    // remove styles
    removeNgStyles();
  }
  hmrAfterDestroy(store) {
    // display new elements
    store.disposeOldHosts();
    delete store.disposeOldHosts;
  }
}
