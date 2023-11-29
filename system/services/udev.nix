{pkgs, ...}: {
  services = {
    udev.packages = with pkgs; [gnome.gnome-settings-daemon android-udev-rules ledger-udev-rules];
  };
}
