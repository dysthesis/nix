_: let
  wallpaper = ./wallpaper.png;
in {
  wayland.windowManager.hyprland = {
    settings = {
      # define the mod key
      "$MOD" = "SUPER";
      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "polkit-kde-agent"
        "udiskie"
	      "swww init"
	      "swww img ${wallpaper}"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };
      general = {
        # gaps
        gaps_in = 8;
        gaps_out = 12;

        # border thiccness
        border_size = 3;

        # active border color
        "col.active_border" = "rgb(ffffff)";

        # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
        apply_sens_to_raw = 0;

        layout = "master";
      };
      decoration = {
        # fancy corners
        rounding = 12;

        # blur
        blur = {
          enabled = true;
          size = 12;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = 1;
          xray = true;
          contrast = 1;
        };

        # shadow config
        drop_shadow = "yes";
        shadow_range = 20;
        shadow_render_power = 8;
        "col.shadow" = "rgba(292c3cee)";
      };

      animations = {
        enabled =
          true; # we want animations, half the reason why we're on Hyprland innit

        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "overshot, 0.4,0.8,0.2,1.2"
        ];

        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border,1,10,default"

          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces,1,4,overshot,slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = "yes";
        no_gaps_when_only = false;
      };

      master = {new_is_master = false;};

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        vfr = true;
        vrr = 0;
        animate_manual_resizes = true;
        mouse_move_focuses_monitor = true;
        enable_swallow = true;
        swallow_regex = "kitty|thunar";
      };

      layerrule = [
        "blur, ^(gtk-layer-shell)$"
        "ignorezero, ^(gtk-layer-shell)$"
        "blur, notifications"
        "ignorezero, notifications"
        "blur, bar"
        "ignorezero, bar"
        "ignorezero, ^(gtk-layer-shell|rofi)$"
        "blur, ^(gtk-layer-shell|rofi)$"
      ];

      bind = [
        "$MOD, RETURN, exec, kitty"
        "$MOD, Q, killactive"
        "$MOD, M, exit"
        "$MOD, backspace, exec, wlogout"
        "$MOD, E, exec, emacsclient -c -a 'emacs'"
        "$MOD, T, togglefloating"
        "$MOD, R, exec, pkill rofi || rofi -show drun"
        "$MOD, F, fullscreen"
        "$MOD, C, exec, pkill rofi || rofi -show calc"
        "$MOD, X, exec, pkill rofi || rofi -show run"
        "$MOD, B, exec, pkill rofi || rofi -show filebrowser"
        "$MOD, left, movefocus, l"
        "$MOD, right, movefocus, r"
        "$MOD, up, movefocus, u"
        "$MOD, down, movefocus, d"
        ''$MOD, P, exec, grim -g "$(slurp)" - | swappy -f -''
        "$MOD, 1, workspace, 1"
        "$MOD, 2, workspace, 2"
        "$MOD, 3, workspace, 3"
        "$MOD, 4, workspace, 4"
        "$MOD, 5, workspace, 5"
        "$MOD, 6, workspace, 6"
        "$MOD, 7, workspace, 7"
        "$MOD, 8, workspace, 8"
        "$MOD, 9, workspace, 9"
        "$MOD, 0, workspace, 10"
        "$MODSHIFT, 1, movetoworkspace, 1"
        "$MODSHIFT, 2, movetoworkspace, 2"
        "$MODSHIFT, 3, movetoworkspace, 3"
        "$MODSHIFT, 4, movetoworkspace, 4"
        "$MODSHIFT, 5, movetoworkspace, 5"
        "$MODSHIFT, 6, movetoworkspace, 6"
        "$MODSHIFT, 7, movetoworkspace, 7"
        "$MODSHIFT, 8, movetoworkspace, 8"
        "$MODSHIFT, 9, movetoworkspace, 9"
        "$MODSHIFT, 0, movetoworkspace, 10"
        "$MOD, mouse_down, workspace, e+1"
        "$MOD, mouse_up, workspace, e-1"
      ];

      bindm = ["$MOD,mouse:272,movewindow" "$MOD,mouse:273,resizewindow"];
      # binds that will be repeated, a.k.a can be held to toggle multiple times
      binde = [
        # volume controls
        ",XF86AudioRaiseVolume, exec, volume -i 5"
        ",XF86AudioLowerVolume, exec, volume -d 5"
        ",XF86AudioMute, exec, volume -t"

        # brightness controls
        ",XF86MonBrightnessUp,exec,brightness set +5%"
        ",XF86MonBrightnessDown,exec,brightness set 5%-"
      ];

      # binds that are locked, a.k.a will activate even while an input inhibitor is active
      bindl = [
        # media controls
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioPrev,exec,playerctl previous"
        ",XF86AudioNext,exec,playerctl next"
      ];
      windowrulev2 = [
        "noshadow, floating:0"
        "fullscreen,class:wlogout"
        "fullscreen,title:wlogout"

        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit focus,class:kitty"

        "idleinhibit fullscreen, class:^(firefox)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        "float,class:udiskie"

        # pavucontrol
        "float,class:pavucontrol"
        "float,title:^(Volume Control)$"
        "size 800 600,title:^(Volume Control)$"
        "move 75 44%,title:^(Volume Control)$"
        "float, class:^(imv)$"
      ];

      env = "XCURSOR_SIZE,24";
    };

    extraConfig = ''
      # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
      # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

       monitor = HDMI-A-1,1920x1080,0x0,1  # Acer monitor
       monitor = DP-2,1920x1080,1920x0,1   # MSI monitor


      # █▀ █▀█ █▀▀ █▀▀ █ ▄▀█ █░░
      # ▄█ █▀▀ ██▄ █▄▄ █ █▀█ █▄▄
       bind = SUPER, a, togglespecialworkspace
       bind = SUPERSHIFT, a, movetoworkspace, special
       bind = SUPER, c, exec, hyprctl dispatch centerwindow
    '';
  };
}
