{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: { georgia-pro = super.callPackage ../../packages/georgia-fonts { }; })
  ];
  fonts = {
    packages = with pkgs; [
      georgia-pro
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
        monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Roboto" "Noto Color Emoji" ];
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
