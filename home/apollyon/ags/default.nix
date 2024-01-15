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
    lexend
    python311Packages.material-color-utilities
    #poetry
    python311Packages.build
    python311Packages.pillow
    material-symbols
    inotify-tools
    nlohmann_json
    python311Packages.pywal
    pywal
    typescript
    tesseract
    yad
    ydotool
    gojq
    xorg.xrandr
    webp-pixbuf-loader
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
