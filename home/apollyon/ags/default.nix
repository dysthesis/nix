{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    sassc
    coreutils
    curl
    gjs
    ripgrep
    python311Packages.material-color-utilities
    material-symbols
    inotify-tools
    typescript
    libdbusmenu-gtk3
    gtk-layer-shell
    gobject-introspection
  ];

  programs.ags = {
    enable = true;
    # configDir = ./config;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
