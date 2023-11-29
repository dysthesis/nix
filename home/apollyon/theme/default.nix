{ pkgs, ... }: let
  phocus-oxocarbon = pkgs.callPackage ../../../packages/oxocarbon-gtk {  };
in {
  home.packages = with pkgs; [
    font-awesome
    adw-gtk3
    nerdfonts
  ];

  imports = [
    ./colours.nix
  ];

  gtk = {
    enable = true;

    theme = {
      name = "phocus";
      package = phocus-oxocarbon;
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
}
