_: {
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/f64f061a-8e37-4a9c-b170-f4415329ec34";
      preLVM = true;
      allowDiscards = true;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_1TB_S5GXNF0W187823Z-part2";
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
      device = "/dev/disk/by-uuid/B21E-89D9";
      fsType = "vfat";
    };
  };
}
