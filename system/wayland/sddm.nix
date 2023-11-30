{pkgs, ...}: {
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${import ../../packages/sugar-dark-sddm { inherit pkgs; }}";
  };
}
