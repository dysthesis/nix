{
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    terminal = lib.getExe pkgs.kitty;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
    extraConfig = {
      modi = "run,drun,filebrowser,calc";
      icon-theme = "Tela-dracula-dark";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "  Apps ";
      display-run = "  Run ";
      display-filebrowser = "  Files ";
      display-calc = " 󰃬 Calc ";
      sidebar-mode = true;
    };
  };
}
