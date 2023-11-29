{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}: {
  networking.hostName = "phobos";
  networking.hostId = "7371e7c8"; # Required for ZFS
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
    # opencl drivers
    rocm-opencl-icd
    rocm-opencl-runtime

    # mesa
    mesa

    # vulkan
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
  ];

  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
    rocm-opencl-icd
    rocm-opencl-runtime
    driversi686Linux.mesa
  ];


  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./filesystems.nix

    ../../system # import all modules, this can be changed to select individual files if needed
  ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  time.timeZone = "Australia/Sydney";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
