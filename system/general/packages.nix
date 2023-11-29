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

      # Language Server for Nix
      nil
      statix
      deadnix

      python312
      git
      bat
      neovim
      vim
      wget
      btop
      weechat
      wgetpaste
      thefuck
      tldr
      lazygit
      openssl
      zip

      # SDDM
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtsvg
      gcc
      tldr
      ripgrep
      wl-clipboard
      libsForQt5.qt5.qtwayland
      qt6.qtwayland
      eza
      wlr-randr
      rustc
      cargo
      mpv
      mpd
      ncmpcpp
      libcanberra-gtk3
      libmpdclient
      libevdev
      libappindicator-gtk3
      gtkmm3
      jsoncpp
      libsigcxx
      libsigcxx30
      polkit-kde-agent
      fmt
      spdlog
      gobject-introspection
      libpulseaudio
      libnl
      libdbusmenu-gtk3
      pamixer
      pavucontrol
      foliate
      pandoc
      socat
      jq
      unzip
      ffmpeg
      fd
      usbguard
    ]
    ++ [
      #inputs.nh.packages.${pkgs.system}.default
      inputs.alejandra.defaultPackage.${pkgs.system}
    ];

  # services.flatpak.enable = true;
}
