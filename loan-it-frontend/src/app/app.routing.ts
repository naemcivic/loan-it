import { RouterModule, Routes } from '@angular/router';
import { DeviceComponent } from './devices/device.component'



const routes: Routes = [
  { path: '', redirectTo: '/devices', pathMatch: 'full' },
  {
  	path: 'devices',
  	component: DeviceComponent
  }
  // { path: 'about', component: AboutComponent}
];

export const routing = RouterModule.forRoot(routes);
