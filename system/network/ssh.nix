{lib, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = lib.mkForce "no";
      PasswordAuthentication = lib.mkForce true;
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 3;
  };
}
