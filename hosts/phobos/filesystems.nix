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
      device = "/dev/disk/by-uuid/476ba323-5745-4700-bd0b-2741c9b5f152";
      preLVM = true;
      allowDiscards = true;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/61cc3a21-7b0d-4671-8a3c-838aef5a8dfc";
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
      device = "/dev/disk/by-uuid/885C-B8B3";
      fsType = "vfat";
    };
  };
}
