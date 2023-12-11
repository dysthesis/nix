{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=14";
        pad = "27x27";
        dpi-aware = "yes";
        notify =
          "${pkgs.libnotify}/bin/notify-send -a foot -i foot \${title} \${body}";
      };
      mouse.hide-when-typing = "yes";
      scrollback.lines = 32768;
      url.launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
      tweak.grapheme-shaping = "yes";
      cursor.style = "beam";
      colors = with config.colorscheme.colors; {
        background = "${base00}";
        foreground = "${base04}";
        regular0 = "${base01}";
        regular1 = "${base08}";
        regular2 = "${base0B}";
        regular3 = "${base0A}";
        regular4 = "${base0D}";
        regular5 = "${base0E}";
        regular6 = "${base0C}";
        regular7 = "${base06}";
        bright0 = "${base02}";
        bright1 = "${base08}";
        bright2 = "${base0B}";
        bright3 = "${base0A}";
        bright4 = "${base0D}";
        bright5 = "${base0E}";
        bright6 = "${base0C}";
        bright7 = "${base07}";
      };
    };
  };
}
