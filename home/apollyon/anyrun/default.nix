{
  inputs,
  pkgs,
  ...
}: let
  anyrunPkgs = inputs.anyrun.packages.${pkgs.system};
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
      y.fraction = 0.02;
      showResultsImmediately = false;
    };

    extraCss = ''
      * {
        color: #ffffff;
        font-family: CartographCF Nerd Font;
        font-size: 1.1rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match:selected {
        background: rgba(237, 93, 83, 1);
      }

      #match {
        padding: 3px;
        border-radius: 8px;
      }

      #entry {
        border-radius: 8px;
      }

      box#main {
        background: rgba(22, 22, 22, 1);
        border: 1px solid #ffffff;
        border-radius: 12px;
        padding: 8px;
      }

      row:first-child {
        margin-top: 6px;
      }
    '';
  };
}
