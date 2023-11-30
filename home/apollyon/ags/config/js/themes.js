/**
 * A Theme is a set of options that will be applied
 * ontop of the default values. see options.js for possible options
 */
import { Theme, WP, HOME } from './settings/theme.js';

export default [

Theme({
  name: 'Oxocarbon',
  icon: '󰹻 ',
  "workspaces": 10,
  "misc.pywal.theme": "base16-default",
  "misc.gtk.theme": "phocus",
  "misc.gtkIcons.theme": "Tela-black-dark",


  "spacing": 4,
  "padding": 6,
  "radii": 8,
  "popover_padding_multiplier": 1.4,

  "color.red": "#ff7eb6",
  "color.green": "#42be65",
  "color.yellow": "#33b1ff",
  "color.blue": "#08bdba",
  "color.magenta": "#ff7eb6",
  "color.teal": "#3ddbd9",
  "color.orange": "#ee5396",

  "theme.scheme": "dark",
  "theme.bg": "#161616",
  "theme.fg": "#ffffff",
  "theme.accent.accent": "$blue",
  "theme.accent.fg": "$bg-color",
  "theme.accent.gradient": "to right, $accent, lighten($accent, 14%)",
  "theme.widget.bg": "$fg-color",
  "theme.widget.opacity": 94,

  "border.color": "$fg-color",
  "border.opacity": 100,
  "border.width": 0,
  "border.barcolor": "$accent",

  // "hypr.inactive_border": "rgba(333333ff)",
  // "hypr.wm_gaps": 6,

  "font.font": "JetBrainsMono Nerd Font",
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


