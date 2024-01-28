{ pkgs, ... }: {
  home.packages = with pkgs; [
    font-awesome
    libsForQt5.qt5ct
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

    font = {
      name = "Inter Medium";
      size = 10;
      package = pkgs.inter;
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
    platformTheme = "qtct"; # just an override for QT_QPA_PLATFORMTHEME, takes “gtk”, “gnome”, “qtct” or “kde”
    style = {
      package = pkgs.graphite-kde-theme;
      name = "GraphiteDark";
    };
  };
  xdg.configFile = {
    "Kvantum/GraphiteDark" = {
      source = ./Kvantum/Graphite;
      recursive = true;
    };
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=GraphiteDark

      [Applications]
      GraphiteDark=qt5ct, org.qbittorrent.qBittorrent, hyprland-share-picker
    '';
  };
}
