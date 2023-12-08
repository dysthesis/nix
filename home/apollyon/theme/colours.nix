{ inputs, ... }:

{
  # colorscheme = inputs.nix-colors.lib.schemeFromYAML "oxocarbon-dark" (builtins.readFile ./palettes/base16-oxocarbon-dark.yaml);
  imports = [ ./palettes/graphite.nix ];
}
