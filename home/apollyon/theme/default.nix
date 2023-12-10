{ pkgs, ... }: {
  home.packages = with pkgs; [
    font-awesome
    adw-gtk3
    nerdfonts
    libsForQt5.qt5ct
    breeze-icons
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  imports = [ ./colours.nix ];

  gtk = {
    enable = true;

    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme.override {
        tweaks = [ "black" "rimless" "float" ];
      };
    };

    iconTheme = {
      name = "Tela-black-dark";
      package = pkgs.tela-icon-theme;
    };
  };

  home = {
    sessionVariables = {
      # scaling - 1 means no scaling
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";

      # use wayland as the default backend, fallback to xcb if wayland is not available
      QT_QPA_PLATFORM = "wayland;xcb";

      # disable window decorations everywhere
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      # remain backwards compatible with qt5
      DISABLE_QT5_COMPAT = "0";

      # tell calibre to use the dark theme, because the light one hurts my eyes
      CALIBRE_USE_DARK_PALETTE = "1";
    };

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme =
      "gtk"; # just an override for QT_QPA_PLATFORMTHEME, takes “gtk”, “gnome”, “qtct” or “kde”
    style = {
      package = pkgs.adwaita-qt;
      name = "Adawaita-dark";
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source =
      (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
        General.theme = "Graphite-rimlessDark";
        Applications.graphite.rimlessDark = ''
          qt5ct, org.kde.dolphin, org.kde.kalendar, org.qbittorrent.qBittorrent, hyprland-share-picker, dolphin-emu, Nextcloud, nextcloud, cantata, org.kde.kid3-qt
        '';
      };

    "Kvantum/Graphite-rimlessDark/Graphite-rimlessDark.kvconfig".source =
      ./Graphite-rimlessDark.kvconfig;
    "Kvantum/Graphite-rimlessDark/catppuccin.svg".source =
      ./Graphite-rimlessDark.svg;
  };
}
