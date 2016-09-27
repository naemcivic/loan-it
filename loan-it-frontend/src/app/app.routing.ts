import { RouterModule, Routes } from '@angular/router';

import { DeviceComponent } from './devices/device.component'
import { BrokenDeviceComponent } from './devices/broken_device.component'
import { CreateDeviceComponent } from './devices/create_device.component'
import { CreateLoanComponent } from './devices/create_loan.component'
import { ShowDeviceComponent } from './devices/show_device.component'
import { LoginComponent } from './login.component';

import { LoggedInGuard } from './logged-in.guard';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'devices', component: DeviceComponent, canActivate: [LoggedInGuard]},
  { path: 'brokendevices', component: BrokenDeviceComponent, canActivate: [LoggedInGuard]},
  { path: 'createdevice', component: CreateDeviceComponent, canActivate: [LoggedInGuard] },
  { path: 'device/:id', component: ShowDeviceComponent, canActivate: [LoggedInGuard] },
  { path: 'login', component: LoginComponent },
  { path: 'device/:id/createloan', component: CreateLoanComponent, canActivate: [LoggedInGuard] }
];

export const routing = RouterModule.forRoot(routes);
