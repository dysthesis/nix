# Note that any devices or directories modified via the WebUI will not persist, changes should be made via this document
_: {
  services.syncthing = {
    enable = true;
    user = "apollyon";
    group = "users";
    dataDir = "/home/apollyon";
    configDir = "/home/apollyon/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "Laptop" = {
          id =
            "57QNWUZ-MS7F456-NOEU5PR-WLE35AI-UUFDR7J-GGD4BUV-FQW7ERF-XZ4QWA3";
        };
        "Phone" = {
          id =
            "TCID6BG-O26ICUC-CI7IDL4-IWW5XID-5DKMYRE-EBJDAA6-62MB3Q6-TTKKEQV";
        };
      };
      folders = {
        "/home/apollyon/Documents/Books" = {
          id = "vayct-kypsa";
          label = "Books";
          devices = [ "Laptop" ];
        };
        "/home/apollyon/Sync" = {
          id = "awzmm-tzrc7";
          label = "Sync";
          devices = [ "Laptop" "Phone" ];
        };
        "/home/apollyon/Zotero" = {
          id = "zavoq-x9h3d";
          label = "Zotero";
          devices = [ "Laptop" ];
        };
        "/home/apollyon/Music" = {
          id = "xv348-fy6qn";
          label = "Music";
          devices = [ "Laptop" "Phone" ];
        };
        "/home/apollyon/Pictures/Camera" = {
          id = "pixel_6a_zssj-photos";
          label = "Camera";
          devices = [ "Phone" ];
        };
        "/home/apollyon/Pictures/Images" = {
          id = "yfg4a-jvzny";
          label = "Pictures";
          devices = [ "Phone" ];
        };
        "/home/apollyon/Documents/Audiobooks" = {
          id = "mg921-1w6bm";
          label = "Audiobooks";
          devices = [ "Phone" ];
        };
      };
    };
  };
}
