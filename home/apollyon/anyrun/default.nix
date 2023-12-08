{ inputs, pkgs, ... }:
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
        # inputs.anyrun-nixos-options.packages.${pkgs.system}.default
      ];

      width.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
      y.fraction = 2.0e-2;
      showResultsImmediately = false;
    };

    extraCss = with config.colorscheme.colors; ''
      * {
        color: ${base04};
        font-family: JetBrainsMono Nerd Font;
        font-size: 1rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match:selected {
        background: ${base0D};
      }

      #match {
        padding: 3px;
        border-radius: 8px;
      }

      #entry {
        border-radius: 8px;
      }

      box#main {
        background: ${base00};
        border: 1px solid ${base04};
        border-radius: 12px;
        padding: 8px;
      }

      row:first-child {
        margin-top: 6px;
      }
    '';
  };
}
