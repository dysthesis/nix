{config, ...} : {
  programs.kitty = {
    enable = true;
    font = {
      name = "CartographCF Nerd Font";
      size = 12;
    };

    settings = {
      background_opacity = "1";
      window_margin_width = 15;
      disable_ligatures = "never";
      # Colorscheme
      foreground = "#${config.colorScheme.colors.base06}";
      background = "#${config.colorScheme.colors.base00}";
      selection_background = "#${config.colorScheme.colors.base03}";
      selection_foreground = "#${config.colorScheme.colors.base05}";
      url_color = "#${config.colorScheme.colors.base0A}";
      cursor = "#${config.colorScheme.colors.base05}";
      active_border_color = "#${config.colorScheme.colors.base0A}";
      inactive_border_color = "#${config.colorScheme.colors.base0C}";
      active_tab_background = "#${config.colorScheme.colors.base0A}";
      active_tab_foreground = "#${config.colorScheme.colors.base00}";
      inactive_tab_background = "#${config.colorScheme.colors.base02}";
      inactive_tab_foreground = "#${config.colorScheme.colors.base04}";
      tab_bar_background = "#${config.colorScheme.colors.base00}";
      color0 = "#${config.colorScheme.colors.base01}";
      color8 = "#${config.colorScheme.colors.base02}";

      color1 = "#${config.colorScheme.colors.base0C}";
      color9 = "#${config.colorScheme.colors.base0C}";

      color2  = "#${config.colorScheme.colors.base0D}";
      color10 = "#${config.colorScheme.colors.base0D}";

      color3 = "#${config.colorScheme.colors.base0F}";
      color11 = "#${config.colorScheme.colors.base0F}";

      color4 = "#${config.colorscheme.colors.base0B}";
      color12 = "#${config.colorscheme.colors.base0B}";

      color5 = "#${config.colorScheme.colors.base0A}";
      color13 = "#${config.colorScheme.colors.base0A}";

      color6 = "#${config.colorscheme.colors.base08}";
      color14 = "#${config.colorscheme.colors.base08}";

      color7 = "#${config.colorScheme.colors.base04}";
      color15 = "#${config.colorScheme.colors.base06}";

    };
  };
}
