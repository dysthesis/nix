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
      ];

      width.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
      y.fraction = 0.02;
      showResultsImmediately = true;
    };

    extraCss = ''
      * {
        transition: 200ms ease-out;
        color: #ffffff;
        font-family: Lato Regular;
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
        background: rgba(120, 169, 255, 1);
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
