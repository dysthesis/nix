{ config, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = let colour = config.colorScheme.colors;
               in {
                     background_opacity = "1";
                     window_margin_width = 15;
                     disable_ligatures = "never";
                     update_check_interval = "0";

                     # Colourscheme
                     foreground = "#${colour.base04}";
                     background = "#${colour.base00}";
                     selection_background = "#${colour.base07}";
                     selection_foreground = "#${colour.base01}";
                     url_color = "#${colour.base0C}";
                     cursor = "#${colour.base05}";
                     active_border_color = "#${colour.base0A}";
                     inactive_border_color = "#${colour.base0C}";
                     active_tab_background = "#${colour.base0A}";
                     active_tab_foreground = "#${colour.base00}";
                     inactive_tab_background = "#${colour.base02}";
                     inactive_tab_foreground = "#${colour.base04}";
                     tab_bar_background = "#${colour.base00}";
                     color0 = "#${colour.base00}";
                     color1 = "#${colour.base08}";
                     color2 = "#${colour.base0B}";
                     color3 = "#${colour.base0A}";
                     color4 = "#${colour.base0D}";
                     color5 = "#${colour.base0E}";
                     color6 = "#${colour.base0C}";
                     color7 = "#${colour.base05}";
                     color8 = "#${colour.base03}";
                     color9 = "#${colour.base08}";
                     color10 = "#${colour.base0B}";
                     color11 = "#${colour.base0A}";
                     color12 = "#${colour.base0D}";
                     color13 = "#${colour.base0E}";
                     color14 = "#${colour.base0C}";
                     color15 = "#${colour.base07}";
                     color16 = "#${colour.base09}";
                     color17 = "#${colour.base0F}";
                     color18 = "#${colour.base01}";
                     color19 = "#${colour.base02}";
                     color20 = "#${colour.base04}";
                     color21 = "#${colour.base06}";
    };
  };
}
