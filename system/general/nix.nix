{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      allowed-users = ["apollyon"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlay
    ];
  };

  # Display diff after rebuild (from )https://github.com/luishfonseca/dotfiles/blob/main/modules/upgrade-diff.nix
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };
}
