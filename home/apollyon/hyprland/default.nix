{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = { enable = true; };
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  imports = [
    ./configuration.nix
  ];

  home.packages = with pkgs; [
    swww
    udiskie
    libnotify
    xdg-desktop-portal-hyprland
    wl-clip-persist
    wl-clipboard
    playerctl
    libsForQt5.polkit-kde-agent
  ];
}
