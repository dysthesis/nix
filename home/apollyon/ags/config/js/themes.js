/**
 * A Theme is a set of options that will be applied
 * ontop of the default values. see options.js for possible options
 */
import { Theme, WP, HOME } from './settings/theme.js';

export default [

Theme({
  name: 'Graphite',
  icon: '󰹻 ',
  "workspaces": 10,
  "misc.pywal.theme": "base16-default",
  "misc.gtk.theme": "Graphite-dark",
  "misc.gtkIcons.theme": "Tela-black-dark",


  "spacing": 4,
  "padding": 6,
  "radii": 8,
  "popover_padding_multiplier": 1.4,

  "color.red": "#ff5555",
  "color.green": "#5af78e",
  "color.yellow": "#f3f99d",
  "color.blue": "#9aedfe",
  "color.magenta": "#ff6ac1",
  "color.teal": "#57c7ff",
  "color.orange": "#fabe2c",

  "theme.scheme": "dark",
  "theme.bg": "#161616",
  "theme.fg": "#ffffff",
  "theme.accent.accent": "#9aedfe",
  "theme.accent.fg": "$bg-color",
  "theme.accent.gradient": "$accent",
  "theme.widget.bg": "$fg-color",
  "theme.widget.opacity": 94,

  "border.color": "$fg-color",
  "border.opacity": 100,
  "border.width": 0,
  "border.barcolor": "$accent",

  // "hypr.inactive_border": "rgba(333333ff)",
  // "hypr.wm_gaps": 6,

  "font.font": "Lato",
  "font.mono": "JetBrainsMono Nerd Font",
  "font.size": 13,

  "applauncher.width": 500,
  "applauncher.height": 400,
  "applauncher.icon_size": 32,

  "bar.position": "bottom",
  // "bar.style": "floating",
  "bar.flat_buttons": true,
  "bar.separators": true,
  "bar.icon": "distro-icon",

  "battery.bar.width": 70,
  "battery.bar.height": 14,
  "battery.low": 15,
  "battery.medium": 35,

  "desktop.wallpaper.fg": "#fff",
  "desktop.drop_shadow": false,
  "desktop.shadow": "rgba(0, 0, 0, .6)",

  "notifications.black_list": [
    "Spotify"
  ],

  "notifications.position": [
    "bottom"
  ],

  "notifications.width": 450,
  "dashboard.sys_info_size": 70,

  "mpris.black_list": [
      "Caprine"
    ],

  "mpris.preferred": "spotify",
  }),
];


