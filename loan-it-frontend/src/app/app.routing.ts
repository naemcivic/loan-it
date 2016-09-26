import { RouterModule, Routes } from '@angular/router';
import { DeviceComponent } from './devices/device.component'
import { BrokenDeviceComponent } from './devices/broken_device.component'
import { CreateDeviceComponent } from './devices/create_device.component'



const routes: Routes = [
  { path: '', redirectTo: '/devices', pathMatch: 'full' },
  { path: 'devices', component: DeviceComponent},
  { path: 'brokendevices', component: BrokenDeviceComponent },
  { path: 'createdevice', component: CreateDeviceComponent },


  // { path: 'about', component: AboutComponent}
];

export const routing = RouterModule.forRoot(routes);
