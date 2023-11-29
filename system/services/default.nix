{pkgs, ...}: {
  imports = [
    ./tor.nix
    ./dbus.nix
    ./udev.nix
    ./udisks.nix
    ./journald.nix
    ./syncthing.nix
  ];

  services = {
    lorri.enable = true;
    udisks2.enable = true;
    printing.enable = true;
    fstrim.enable = true;
    gnome = {
      gnome-settings-daemon.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
    };
  };

  systemd.services = {
    seatd = {
      enable = true;
      description = "Seat management daemon";
      script = "${pkgs.seatd}/bin/seatd -g wheel";
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
      };
      wantedBy = ["multi-user.target"];
    };
  };
}
