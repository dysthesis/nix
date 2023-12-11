{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {enable = true;};
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  imports = [
    ./wlsunset.nix
    ./configuration.nix
  ];

  home.packages = with pkgs; [
    pyprland
    swww
    udiskie
    libnotify
    xdg-desktop-portal-hyprland
    wl-clip-persist
    wl-clipboard
    playerctl
    grim
    slurp
    swappy
    pavucontrol
    imagemagick
    libsForQt5.polkit-kde-agent
  ];
}
