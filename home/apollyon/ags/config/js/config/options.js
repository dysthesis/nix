export default {
    workspaces: 10,
    bar: {
      position: 'bottom',
      icon: '',
      separators: true,
    },
    gtk: {
      theme: "Graphite-Dark",
      icon-theme: "Tela-black-dark",
    },
    font: {
      font: "JetBrainsMono Nerd Font",
      mono: "JetBrainsMono Nerd Font",
      size: 14pt,
    },
    colour: {
      red: "#ff5555",
      green: "#5af78e",
      yellow: "#f3f99d",
      blue: "#57c7ff",
      magenta: "#ff6ac1",
      teal: "#9aedfe",
      orange: "#fabe2c",
      foreground: "#ffffff",
      background: "#000000",
      accent: "#9aedfe",
    },
    substitutions: {
        icons: [
          ['transmission-gtk', 'transmission'],
          ['blueberry.py', 'bluetooth'],
          ['Caprine', 'facebook-messenger'],
          ['', 'preferences-desktop-display'],
        ],
        titles: [
          ['com.github.Aylur.ags', 'AGS'],
          ['transmission-gtk', 'Transmission'],
          ['com.obsproject.Studio', 'OBS'],
          ['com.usebottles.bottles', 'Bottles'],
          ['com.github.wwmm.easyeffects', 'Easy Effects'],
          ['org.gnome.TextEditor', 'Text Editor'],
          ['org.gnome.design.IconLibrary', 'Icon Library'],
          ['blueberry.py', 'Blueberry'],
          ['org.wezfurlong.wezterm', 'Wezterm'],
          ['com.raggesilver.BlackBox', 'BlackBox'],
          ['firefox', 'Firefox'],
          ['org.gnome.Nautilus', 'Files'],
          ['libreoffice-writer', 'Writer'],
          ['', 'Desktop'],
        ],
    },
    notifications: {
      black_list: [
        'Spotify'
      ],
      position: 'bottom',
      width: 450,
    },
}
