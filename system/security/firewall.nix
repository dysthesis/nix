_: {
  networking.firewall = {
    enable = true;
    # if your minecraft server is not worky
    # this is probably why
    allowedTCPPorts = [2137 33703];
    allowedUDPPorts = [33703];
    allowPing = false;
    logReversePathDrops = true;
  };
}
