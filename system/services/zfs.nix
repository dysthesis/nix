_: {
  services = {
    zfs = {
      autoScrub.enable = true;
      trim.enable = true;
    };

    sanoid = {
      enable = true;
      templates.default = {
        hourly = 24;
        daily = 7;
        monthly = 3;
        yearly = 3;
        autosnap = true;
      };
      datasets."styx/home" = {
        useTemplate = ["default"];
        recursive = true;
      };
    };
  };
}
