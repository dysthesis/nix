{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zsh-forgit
    gitflow
  ];
  programs.git = {
    enable = true;
    userName = "Dysthesis";
    userEmail = "github.9258n@aleeas.com";
    aliases = {
      c = "commit -am";
      s = "status";
      a = "add -A";
    };
  };
}
