{pkgs, ...}: {
  imports = [
    ./colours.nix
  ];
  gtk = {
    iconTheme = {
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = ["dracula"];
      };
      name = "Tela-circle-dracula-dark";
    };
    font = {
      name = "Lato";
      size = 11;
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
