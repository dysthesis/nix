_: {
  security.pam = {
    services.gtklock.text = "auth include login";
    loginLimits = [
      {
        domain = "@wheel";
        item = "nofile";
        type = "soft";
        value = "524288";
      }
      {
        domain = "@wheel";
        item = "nofile";
        type = "hard";
        value = "1048576";
      }
    ];
    services = {
      login.enableGnomeKeyring = true;
    };
  };
}
