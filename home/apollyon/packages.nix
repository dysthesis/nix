{pkgs, ...}: {
  home.packages = with pkgs; [
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
