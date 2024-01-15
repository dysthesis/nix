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
      device = "/dev/disk/by-uuid/123c25de-82aa-493d-bbaf-b1380466f7d7";
      preLVM = true;
      allowDiscards = true;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/029ddcb0-c4d0-47d7-b34c-46712ca7c4b0";
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

    "/boot" = {
      device = "/dev/disk/by-uuid/723E-9A5D";
      fsType = "vfat";
    };
  };
}
