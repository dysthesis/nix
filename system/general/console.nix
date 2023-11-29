{
  config,
  pkgs,
  ...
}: {
  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-118n.psf.gz";
    # useXkbConfig = true; # use xkbOptions in tty.
  };
}
