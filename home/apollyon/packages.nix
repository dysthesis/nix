{pkgs, ...}: {
home.packages = with pkgs; [
    argparse
    python310Packages.fontforge
    fontforge
    firefox
    thunderbird
    pcmanfm
    noto-fonts
    roboto
    lato
    noto-fonts-cjk
    libsForQt5.ark
    noto-fonts-emoji
    (nerdfonts.override {
        fonts = [
            "JetBrainsMono"
            "CascadiaCode"
        ];
    })
  ];
}
