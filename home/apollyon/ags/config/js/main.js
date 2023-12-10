import Bar from './windows/bar/main.js';
import Dashboard from './windows/dashboard/main.js';
import Notifications from './windows/notifications/main.js';

const windows = () => [
  forMonitors(Bar),
  forMonitors(Notifications),
  Dashboard();
];

export default {
  windows: windows().flat(1),
  maxStreamVolume: 1.05,
  cacheNotificationActions: true,
  closeWindowDelay: {
    'quicksettings': options.transition.value,
    'dashboard': options.transition.value,
  },
};
