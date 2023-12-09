import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js';
import Mpris from 'resource:///com/github/Aylur/ags/service/mpris.js';
import Audio from 'resource:///com/github/Aylur/ags/service/audio.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const Workspaces = () => Widget.Box({
  className: 'workspaces',
  connections: [[Hyprland.active.workspace, self => {
    const arr = Array.from({ length: 10 }, (_, i) => i + 1);
    self.children = arr.map(i => Widget.Button({
      onClicked: () => execAsync(`hyprctl dispatch workspace ${i}`),
      child: Widget.Label(`${i}`),
      className: Hyprland.active.workspace.id == i ? 'focused' : '',
    }));
  }]],
}) ;

const ClientTitle = () => Widget.Label({
  className: 'client-title',
  binds: [
    ['label', Hyprland.active.client, 'title'],
  ],
})

const Clock = () => Widget.Label({
  className: 'clock',
  connections: [
    // this is what you should do
    [1000, self => execAsync(['date', '+%H:%M:%S %b %e.'])
     .then(date => self.label = date).catch(console.error)],
  ],
});

const Notification = () => Widget.Box({
  className: 'notification',
  children: [
    Widget.Icon({
      icon: 'preferences-system-notifications-symbolic',
      connections: [
        [Notifications, self => self.visible = Notifications.popups.length > 0],
      ],
    }),
    Widget.Label({
      connections: [[Notifications, self => {
        self.label = Notifications.popups[0]?.summary || '';
      }]],
    }),
  ],
});

const Media = () => Widget.Button({
  className: 'media',
  onPrimaryClick: () => Mpris.getPlayer('')?.playPause,
  onScrollUp: () => Mpris.getPlayer('')?.next(),
  onScrollDown: () => Mpris.getlayer('')?.previous(),
  child: Widget.Label({
    connections: [[Mpris, self => {
      const mpris = Mpris.getPlayer('');
      if (mpris) {
        self.label = `${mpris.trackArtists.join(', ')} - ${mpris.trackTitle}`;
      } else {
        self.label = 'Nothing is playing';
      }
    }]],
  }),
});

const Volume = () => Widget.Box({
  className: 'volume',
  css: 'min-width: 180px',
  children: [
      Widget.Stack({
        items: [
          ['101', Widget.Icon('audio-volume-overamplified-symbolic')],
          ['67', Widget.Icon('audio-volume-high-symbolic')],
          ['34', Widget.Icon('audio-volume-medium-symbolic')],
          ['1', Widget.Icon('audio-volume-low-symbolic')],
          ['0', Widget.Icon('audio-volume-muted-symbolic')],
        ],
        connections: [[Audio, self => {
          if (!Audio.speaker)
            return;
          if (Audio.speaker.isMuted) {
            self.shown = '0';
            return;
          }
      
          const show = [101, 67, 34, 1, 0].find(
            threshold => threshold <= Audio.speaker.volume * 100
          );
      
          self.shown = `${show}`;
        }, 'speaker-changed']],
      }),
      Widget.Slider({
        hexpand: true,
        drawValue: false,
        onChange: ({ value }) => Audio.speaker.volume = value,
        connections: [[Audio, self => {
          self.value = Audio.speaker?.volume || 0;
        }, 'speaker-changed']],
      }),
  ],
});

const SysTray = () => Widget.Box({
  connections: [[SystemTray, self => {
    self.children = SystemTray.items.map(item => Widget.Button({
      child: Widget.Icon({ binds: [['icon', item, 'icon']] }),
      onPrimaryClick: (_, event) => item.activate(event),
      onSecondaryClick: (_, event) => item.openMenu(event),
      binds: [['tooltip-markup', item, 'tooltip-markup']],
    }));
  }]],
});

const Left = () => Widget.Box({
  children: [
    Workspaces(),
    ClientTitle(),
  ],
});

const Center = () => Widget.Box({
  children: [
    Media(),
    Notification(),
  ],
});

const Right = () => Widget.Box({
  hpack: 'end',
  children: [
    Volume(),
    Clock(),
    SysTray(),
  ],
});

const Bar = ({ monitor } = {}) => Widget.Window({
  name: `bar-${monitor}`,
  className: 'bar',
  monitor,
  anchor: ['bottom', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right(),
  }),
})

export default {
  style: App.configDir + '/style.css',
  window: [
    Bar({ monitor: 0 }),
    Bar({ monitor: 1 })
  ],
};
