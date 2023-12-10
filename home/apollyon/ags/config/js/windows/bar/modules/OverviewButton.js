import App from 'resource:///com/github/Aylur/ags/app.js';
import PanelButton from './PanelButton.js';
import FontIcon from '../../../utils/font-icon/main.js';
import { distroIcon } from '../../../config/variables.js';
import options from '../../../config/options.js';

export default () => PanelButton({
    class_name: 'overview',
    window: 'overview',
    on_clicked: () => App.toggleWindow('overview'),
    content: FontIcon({
        binds: [['icon', options.bar.icon, 'value', v => {
            return v === 'distro-icon' ? distroIcon : v;
        }]],
    }),
});
