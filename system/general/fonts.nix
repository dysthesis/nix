{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: { georgia-pro = super.callPackage ../../packages/georgia-fonts { }; })
    (self: super: { cartograph = super.callPackage ../../packages/cartograph { }; })
    (self: super: { cartograph-nf = super.callPackage ../../packages/cartograph-nf { }; })
  ];
  fonts = {
    packages = with pkgs; [
      cartograph-nf
      georgia-pro
      cartograph
      noto-fonts
      cantarell-fonts
      roboto
      liberation_ttf
      gelasio
      overpass
      lato
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "RobotoMono"
          "CascadiaCode"
          "Iosevka"
          "IosevkaTerm"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "CartographCF Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Roboto" "Noto Color Emoji" ];
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
