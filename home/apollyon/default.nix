{inputs, ...}: {
  imports = [
    ./hyprland
    ./kitty
    ./rofi
    ./theme
    ./emacs
    ./git
    ./eww
    ./packages.nix
  ] ++ [
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
