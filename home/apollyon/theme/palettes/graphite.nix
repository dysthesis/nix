_: {
  colorScheme = {
    slug = "graphite";
    name = "Graphite";
    kind = "dark";
    colors = {
      base00 = "#000000"; # assuming darkest black for background
      base01 = "#030303"; # from SCSS file ($type == 'f')
      base02 = "#0F0F0F"; # from SCSS file ($type == 'g')
      base03 = "#121212"; # from SCSS file ($type == 'h')
      base04 = "#1F1F1F"; # extrapolated for lighter black
      base05 = "#242424"; # extrapolated for default foreground
      base06 = "#2C2C2C"; # extrapolated for lighter foreground
      base07 = "#3C3C3C"; # extrapolated for lightest grey
      # Accent colors (extrapolated, feel free to customize)
      base08 = "#ff5555"; # Red
      base09 = "#fabe2c"; # Orange
      base0A = "#f3f99d"; # Yellow
      base0B = "#5af78e"; # Green
      base0C = "#9aedfe"; # Cyan
      base0D = "#57c7ff"; # Blue
      base0E = "#ff6ac1"; # Magenta
      base0F = "#bdb6c5"; # Light Grey
    };
  };
}
