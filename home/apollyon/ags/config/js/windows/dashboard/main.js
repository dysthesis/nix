import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import PopupWindow from '../../utils/popup-window/main.js';
import options from '../../config/options.js';

import DateColumn from './modules/DateColumn.js';
import NotificationColumn from './modules/NotificationColumn.js';

export default () => PopupWindow({
    name: 'dashboard',
    connections: [[options.bar.position, self => {
        self.anchor = [options.bar.position.value];
        self.transition = 'crossfade';

    }]],
    child: Widget.Box({
        children: [
            NotificationColumn(),
            Widget.Separator({ orientation: 1 }),
            DateColumn(),
        ],
    }),
});
