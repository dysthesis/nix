{pkgs, ...}: {
  home.packages = with pkgs; [
    font-awesome
    papirus-icon-theme
    qogir-icon-theme
    whitesur-icon-theme
    colloid-icon-theme
    adw-gtk3
    nerdfonts
  ];
  imports = [
    ./colours.nix
  ];
  gtk = {
    theme = {
      name = "Materia-dark-compact";
      package = pkgs.materia-theme;
    };

    iconTheme = {
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = ["dracula"];
      };
      name = "Tela-circle-dracula-dark";
    };

    font = {
      name = "Lato";
      size = 12;
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
