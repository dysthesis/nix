{
  inputs,
  ...
}: {
  imports = [inputs.impermanence.nixosModule];
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager"
      "/etc/ssh"
      "/etc/NetworkManager/system-connections"
      "/var/lib/flatpak"
      "/var/lib/libvirt"
      "/var/lib/bluetooth"
      "/etc/secureboot"
    ];
    files = ["/etc/machine-id"];
  };

  systemd.tmpfiles.rules = [
    "L /var/lib/NetworkManager/secret_key - - - - /persist/var/lib/NetworkManager/secret_key"
    "L /var/lib/NetworkManager/seen-bssids - - - - /persist/var/lib/NetworkManager/seen-bssids"
    "L /var/lib/NetworkManager/timestamps - - - - /persist/var/lib/NetworkManager/timestamps"
  ];
}
