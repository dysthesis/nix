{ config, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12;
        normal.family = "JetBrainsMono Nerd Font";
        bold.family = "JetBrainsMono Nerd Font";
        italic.terminal = "JetBrainsMono Nerd Font";
      };

      window = {
        padding.x = 20;
        padding.y = 20;
        decorations = "Full";
      };

      cursor.style = "Beam";

      colors = let colours = config.colorscheme.colors;
      in {
        primary = {
          background = "#${colours.base00}";
          foreground = "#${colours.base04}";
        };

        normal = {
          black = "#${colours.base00}";
          white = "#${colours.base04}";
          red = "#${colours.base08}";
          green = "#${colours.base0B}";
          yellow = "#${colours.base0A}";
          blue = "#${colours.base0D}";
          magenta = "#${colours.base0E}";
          cyan = "#${colours.base0C}";
        };
        bright = {
          black = "#${colours.base00}";
          white = "#${colours.base04}";
          red = "#${colours.base08}";
          green = "#${colours.base0A}";
          blue = "#${colours.base0D}";
          magenta = "#${colours.base0E}";
          cyan = "#${colours.base0C}";
        };
        dim = {
          black = "#${colours.base00}";
          white = "#${colours.base04}";
          red = "#${colours.base08}";
          green = "#${colours.base0B}";
          yellow = "#${colours.base0A}";
          blue = "#${colours.base0D}";
          magenta = "#${colours.base0E}";
          cyan = "#${colours.base0C}";
        };
      };
    };
  };
}
