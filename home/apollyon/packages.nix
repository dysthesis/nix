{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.nautilus
    gnome.sushi
    noto-fonts
    roboto
    lato
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "CascadiaCode"
      ];
    })
  ];
}
