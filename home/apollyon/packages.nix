{pkgs, ...}: {
home.packages = with pkgs; [
    argparse
    python310Packages.fontforge
    fontforge
    firefox
    thunderbird
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
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
