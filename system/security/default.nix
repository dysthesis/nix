_: {
  imports = [
    ./kernel.nix
    ./blocker.nix
    ./firewall.nix
    ./sudo.nix
    ./pam.nix
    ./apparmor.nix
    ./polkit.nix
  ];

  security = {
    # lockKernelModules = true;
    protectKernelImage = true;
    allowSimultaneousMultithreading = true;
    forcePageTableIsolation = true;
  };
}
