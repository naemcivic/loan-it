import { RouterModule, Routes } from '@angular/router';
import { DeviceComponent } from './devices/device.component'
import { BrokenDeviceComponent } from './devices/broken_device.component'
import { LoginComponent } from './login.component';

const routes: Routes = [
  { path: '', redirectTo: '/devices', pathMatch: 'full' },
  { path: 'devices', component: DeviceComponent },
  { path: 'brokendevices', component: BrokenDeviceComponent },
  { path: 'login', component: LoginComponent }
];

export const routing = RouterModule.forRoot(routes);
