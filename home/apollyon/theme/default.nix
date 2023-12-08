{ pkgs, ... }:
let phocus-oxocarbon = pkgs.callPackage ../../../packages/oxocarbon-gtk { };
in {
  home.packages = with pkgs; [ font-awesome adw-gtk3 nerdfonts ];

  # home.sessionVariables = { GTK_THEME = "phocus"; };

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
      package = pkgs.lightly-qt;
      name = "Lightly";
    };
  };
}
