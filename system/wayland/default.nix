_: {
  imports = [
    ./environment.nix
    ./hardware.nix
    ./portals.nix
    ./displays.nix
    ./sddm.nix
  ];
  services.xserver.enable = true;
  programs.dconf.enable = true;
}
