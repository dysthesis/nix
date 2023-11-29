{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python311.withPackages (p: [ p.python-pam ]))
    sassc
    brightnessctl
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
