{ config, inputs, pkgs, ... }:
let anyrunPkgs = inputs.anyrun.packages.${pkgs.system};
in {
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with anyrunPkgs; [
        applications
        rink
        stdin
        translate
        shell
        symbols
        randr
        # inputs.anyrun-nixos-options.packages.#${pkgs.system}.default
      ];

      # the x coordinate of the runner
      #x.relative = 800;
      # the y coordinate of the runner
      #y.absolute = 500.0;
      y.fraction = 2.0e-2;

      # Hide match and plugin info icons
      hideIcons = false;

      # ignore exclusive zones, i.e. Waybar
      ignoreExclusiveZones = false;

      # Layer shell layer: Background, Bottom, Top, Overlay
      layer = "overlay";

      # Hide the plugin info panel
      hidePluginInfo = false;

      # Close window when a click outside the main box is received
      closeOnClick = false;

      # Show search results immediately when Anyrun starts
      showResultsImmediately = false;

      # Limit amount of entries shown in total
      maxEntries = 10;
    };

    extraCss = with config.colorscheme.colors; ''
      * {
        color: #${base04};
        font-family: JetBrainsMono Nerd Font;
        font-size: 1.2rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match:selected {
        background: #${base0D};
      }

      #match {
        padding: 3px;
        border-radius: 8px;
      }

      #entry {
        border-radius: 8px;
      }

      box#main {
        background: #${base00};
        border: 1px solid #${base04};
        border-radius: 12px;
        padding: 8px;
      }

      row:first-child {
        margin-top: 6px;
      }
    '';
  };
}
