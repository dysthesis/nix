{ config, pkgs, ... }: {
  home.packages = with pkgs; [ zsh-forgit gitflow ];
  programs.git = {
    enable = true;
    userName = "Dysthesis";
    userEmail = "antheoraviel@protonmail.com";
    lfs.enable = true;
    delta.enable = true;
    aliases = {
      c = "commit -am";
      s = "status";
      a = "add -A";
    };
  };
}
