{pkgs, ...}: {
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };
  home.packages = with pkgs; [
    bash
    blueberry
    bluez
    brillo
    coreutils
    dbus
    findutils
    gawk
    gnome.gnome-control-center
    gnused
    imagemagick
    jaq
    jc
    libnotify
    networkmanager
    pavucontrol
    playerctl
    procps
    pulseaudio
    ripgrep
    socat
    udev
    upower
    util-linux
    wget
    wireplumber
    wlogout
  ];
}
