{ nixpkgs, nix-colors, self, ... }:
let
  inherit (self) inputs;
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.apollyon = ../home/apollyon;
  };
in {
  # PC
  phobos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      # Home manager

      inputs.home-manager.nixosModules.home-manager
      { inherit home-manager; }

      {
        nixpkgs.overlays = [ inputs.emacs-overlay.overlay inputs.nur.overlay ];
      }

      # Hardware configuration and imports
      ./phobos
    ];
    specialArgs = { inherit inputs nix-colors; };
  };
}
