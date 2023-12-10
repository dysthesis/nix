import App from 'resource:///com/github/Aylur/ags/app.js';
import Clock from '../../../utils/clock/main.js';
import PanelButton from './PanelButton.js';

export default ({ format = '%a, %b %d %H:%M' } = {}) => PanelButton({
    class_name: 'dashboard panel-button',
    on_clicked: () => App.toggleWindow('dashboard'),
    window: 'dashboard',
    content: Clock({ format }),
});
