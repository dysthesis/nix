{pkgs, ...}: {
    home.packages = with pkgs; [
        protonup-qt
        firefox
        thunderbird
        pcmanfm
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
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
