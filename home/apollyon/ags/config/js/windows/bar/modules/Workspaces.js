import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';

import options from '../../../config/options.js';

import { range } from '../../../utils/misc/main.js';

const dispatch = arg => Utils.execAsync(`hyprctl dispatch workspace ${arg}`);

const Workspaces = () => {
  const ws = options.workspaces;
  return Widget.Box({
      children: range(ws || 20).map(i => Widget.Button({
        setup: btn => btn.id = 1,
        on_clicked: () => dispatch(i),
        child: Widget.Label({
          label: `${i}`,
          class_name: 'indicator',
          vpack: 'center',
        }),
        connections: [[Hyprland, btn => {
          btn.toggleClassName('active', Hyprland.active.workspace.id === i);
          btn.toggleClassName('occupied', Hyprland.getWorkspace(i)?.windows > 0);
        }]],
      })),
      connections: ws ? [] : [[Hyprland.active.workspace, box => box.children.map(btn => {
                  btn.visible = Hyprland.workspaces.some(ws => ws.id === btn.id);
      })]],
  });
};

export default () => Widget.Box({
  class_name: 'workspaces panel-button',
  child: Widget.Box({
    // its nested like this to keep it consistent with other PanelButton widgets
    child: Widget.EventBox({
      on_scroll_up: () => dispatch('m+1'),
      on_scroll_down: () => dispatch('m-1'),
      class_name: 'eventbox',
      binds: [['child', options.workspaces, 'value', Workspaces]],
    }),
  }),
});
