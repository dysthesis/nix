_: {
  services = {
    tor = {
      enable = true;
      client.enable = true;
      torsocks.enable = true;
      settings = {
        Sandbox = true;
        MapAddress = [
          "palladium.libera.chat libera75jm6of4wxpxt4aynol3xjmbtxgfyjpu34ss4d7r7q2v5zrpyd.onion"
        ];
      };
    };
  };
}
