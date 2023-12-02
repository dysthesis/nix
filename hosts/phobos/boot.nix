{ config, lib, inputs, pkgs, ... }: {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  environment.systemPackages = with pkgs; [ sbctl ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot = {
        enable = lib.mkForce false;
        editor = false;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
      grub = {
        enable = false;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        theme = null;
        backgroundColor = null;
        splashImage = null;
      };
    };

    bootspec.enable = true;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    initrd = {
      verbose = false;
      systemd.enable = true;

      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "dm_mod"
        "dm_crypt"
        "cryptd"
        "tpm_tis"
      ] ++ config.boot.initrd.luks.cryptoModules;

      kernelModules = [ "amdgpu" ];
    };

    supportedFilesystems = [ "zfs" ];

    # Use the xanmod kernel
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # Use the hardened kernel
    kernelPackages = pkgs.linuxPackages_hardened;

    tmp = {
      useTmpfs = lib.mkDefault true;
      cleanOnBoot = lib.mkDefault (!config.boot.tmp.useTmpfs);
    };
  };
}
