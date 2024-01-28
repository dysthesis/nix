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
      device = "/dev/disk/by-uuid/c8a2f9e6-909a-4c38-ac03-83cfa426e4f8";
      preLVM = true;
      allowDiscards = true;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/6374fb99-1ed6-4909-af64-aa8facdc12b0";
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
      device = "/dev/disk/by-uuid/7591-F8C1";
      fsType = "vfat";
    };
  };
}
