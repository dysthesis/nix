{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    (python311.withPackages (p: [ p.python-pam ]))
    sassc
    coreutils
    curl
    fuzzel
    gjs
    brightnessctl
    procps
    ripgrep
    inotify-tools
    libdbusmenu-gtk3
    gtk-layer-shell
    upower
    gradience
    gobject-introspection
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
