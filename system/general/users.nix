{
  config,
  pkgs,
  ...
}: let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    mutableUsers = false;
    users.root = {
      hashedPassword = "$6$ZUd6HDF76w1gcycL$sRwh1aYZ1kmrtYFWNO3N5fXEojBpx2aus75wur.Tcjp8StMVa9SLneI1pIk9Jtz3hFJ2w1o7PFNc.03KGH32X0";
    };
    users.apollyon = {
      description = "Apollyon";
      isNormalUser = true;
      shell = pkgs.bash;
      hashedPassword = "$6$vpsdlBS0GxdQ8Fl.$6Pa3P6FvX6AvWHRNbPGh2NeeG8NalB5918DJ/J8s7R0oF9C7elqdPcpO6h9Frj75yWEpyxYW.PNLPu68jvvSg0";
      extraGroups =
        [
          "wheel"
          "video"
          "audio"
          "input"
          "nix"
          "networkmanager"
          "tss"
          "libvirtd"
        ]
        ++ ifTheyExist [
          "network"
          "wireshark"
          "mysql"
          "docker"
          "podman"
          "git"
        ];
      packages = with pkgs; [
        tor-browser-bundle-bin
        freetube
        keepassxc
        gnome.gnome-calendar
        ani-cli
        zotero
        neofetch
        beancount
        signal-desktop
        element-desktop
        webcord-vencord
        protonvpn-gui
        nicotine-plus
        qbittorrent
        texlive.combined.scheme-full
        conda
      ];
    };
  };
  programs.fish.enable = true;
}
