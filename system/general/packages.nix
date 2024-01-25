{
  pkgs,
  inputs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      # For TPM LUKS unlocking
      tpm2-tss
      gptfdisk
      git-remote-gcrypt
      # Language Server for Nix
      nil
      statix
      deadnix
      bat
      vim
      wget
      btop
      thefuck
      tldr
      openssl
      zip
      vulnix
      # SDDM
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtsvg
      libsForQt5.qt5.qtwayland
      qt6.qtwayland
      eza
      polkit-kde-agent
      unzip
      ffmpeg
      fd
      usbguard
    ]
    ++ [
      inputs.alejandra.defaultPackage.${pkgs.system}
    ];

  # services.flatpak.enable = true;
}
