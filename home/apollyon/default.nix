{inputs, ...}: {
  imports = [
    ./hyprland
    ./zathura
    ./bash
    ./fish
    ./neofetch
    ./starship
    # ./firefox
    ./kitty
    ./anyrun
    ./theme
    ./emacs
    ./git
    ./ags
    ./packages.nix
  ] ++ [
    inputs.anyrun.homeManagerModules.default
    inputs.ags.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
  ];
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  home = {
    username = "apollyon";
    homeDirectory = "/home/apollyon";
    stateVersion = "23.05";
  };
}
