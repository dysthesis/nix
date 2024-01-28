{ lib, pkgs, ... }: {
        home.packages = with pkgs; [
                blueberry
                brightnessctl
                cliphist
                coreutils
                curl
                fuzzel
                gjs
                gnome.gnome-bluetooth
                gnome.gnome-control-center
                gnome.gnome-keyring
                gobject-introspection
                grim
                gtk3
                gtk-layer-shell
                libdbusmenu-gtk3
                meson
                networkmanager
                nodejs_21
                libsForQt5.plasma-browser-integration
                playerctl
                pywal
                ripgrep
                sassc
                slurp
                starship
                swayidle
                typescript
                upower
                xorg.xrandr
                webp-pixbuf-loader
                wget
                wireplumber
                wl-clipboard
                tesseract
                yad
                ydotool
                cava
                gojq
                gradience
                lexend
                python311Packages.material-color-utilities
                poetry
                python311Packages.build
                python311Packages.pillow
                material-symbols
        ];

        programs.ags = {
                enable = true;
                configDir = ./config;
                extraPackages = with pkgs; [ gtksourceview libsoup_3 ];
        };
}
