{ config, lib, pkgs, ... }:

{
  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      hidden = true;
      preview = true;
      drawbox = true;
      ignorecase = true;
    };
  };
}
