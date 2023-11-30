{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "CartographCF Nerd Font:size=11";
        pad = "27x27";
        dpi-aware = "no";
        notify = "${pkgs.libnotify}/bin/notify-send -a foot -i foot \${title} \${body}";
      };
      mouse.hide-when-typing = "yes";
      scrollback.lines = 32768;
      url.launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
      tweak.grapheme-shaping = "yes";
      cursor.style = "beam";
      colors = with config.colorscheme.colors; {
        background = "${base00}";
        foreground = "${base06}";
        regular0 = "${base00}";
        regular1 = "${base0B}";
        regular2 = "${base0C}";
        regular3 = "${base0D}";
        regular4 = "${base07}";
        regular5 = "${base0F}";
        regular6 = "${base09}";
        regular7 = "${base04}";
        bright0 = "${base03}";
        bright1 = "${base0B}";
        bright2 = "${base0C}";
        bright3 = "${base0D}";
        bright4 = "${base07}";
        bright5 = "${base0F}";
        bright6 = "${base09}";
        bright7 = "${base06}";
      };
    };
  };
}
