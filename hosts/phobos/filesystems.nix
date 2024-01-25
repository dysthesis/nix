{pkgs, ...}: {
  # We need tpm2 for LUKS unlocking
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
    abrmd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    tpm2-tss
  ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/6195fba0-84e9-44e0-959f-88a1d3e4699b";
      preLVM = true;
      allowDiscards = true;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/48d8374c-583a-4a1e-9559-21d82a458b2f";
      randomEncryption = {
        enable = true;
        allowDiscards = true;
      };
    }
  ];

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = ["defaults" "size=2G" "mode=755"];
    };

    "/nix" = {
      device = "styx/nixos/nix";
      fsType = "zfs";
    };

    "/nix/persist" = {
      device = "styx/nixos/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

    "/home/apollyon" = {
      device = "styx/home/apollyon";
      fsType = "zfs";
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/2432-FFFF";
      fsType = "vfat";
    };
  };
}
