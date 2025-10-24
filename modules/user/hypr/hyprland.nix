{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options = {hyprland.enable = lib.mkEnableOption "Enables Hyprland";};

  config = lib.mkIf config.hyprland.enable {
    # Enable Hyprland XDG portal
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      config.common.default = "*";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      plugins = with pkgs; [
        hyprlandPlugins.hyprsplit
      ];

      settings = {
        input = {
          kb_layout = "us";

          follow_mouse = 1;
          mouse_refocus = "false";
          accel_profile = "flat";
          touchpad = {natural_scroll = "yes";};

          sensitivity = 0.2;
        };

        device = {
          name = "wacom-intuos-pro-m-pen";
          output = "DP-4";
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = "rgb(6791C9)";
          "col.inactive_border" = "rgba(595959aa)";

          layout = "dwindle";

          allow_tearing = false;
        };

        plugin = {
          hyprsplit = {
            num_workspaces = 7;
            persistent_workspaces = true;
          };
        };

        decoration = {
          rounding = 0;

          blur = {
            enabled = true;
            size = 3;
            passes = 5;
            new_optimizations = true;
            ignore_opacity = true;
            xray = false;
            popups = true;
          };

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
        };

        animations = {
          enabled = "yes";
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        };

        misc = {
          force_default_wallpaper = 0;
          vfr = true;
        };
      };

      extraConfig = ''
        monitor = eDP-1, preferred, auto, 1
        monitor = DP-1, 1920x1080@144, auto, 1
        monitor = DP-3, preferred, auto, 1
        monitor = DP-4, 1920x1080, auto, 1

        # Animations
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default

        layerrule = blur, waybar
        layerrule = blur, wofi

        $mainMod = SUPER

        # Application actions
        bind = $mainMod, RETURN, exec, kitty
        bind = $mainMod SHIFT, C, killactive,
        bind = $mainMod, escape, exit,
        bind = $mainMod, F, exec, nemo
        bind = $mainMod, V, togglefloating,
        bind = $mainMod, R, exec, wofi
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
        bind = $mainMod, B, exec, qutebrowser
        bind = $mainMod SHIFT, F, exec, firefox
        bind = $mainMod, S, exec, hyprshot -m region -f screenshot.png
        bind = $mainMod SHIFT, S, exec, hyprshot -m window -f screenshot.png
        bind = $mainMod, D, exec, record-region
        bind = $mainMod SHIFT, D, exec, record-window
        bind = $mainMod SHIFT CTRL, D, exec, pkill -INT wf-recorder
        bind = $mainMod SHIFT, X, exec, hyprpicker -an

        # System actions
        bind = $mainMod, M, fullscreen,
        bind = $mainMod SHIFT, Q, exec, systemctl suspend
        bind = $mainMod SHIFT, equal, exec, hyprctl keyword monitor eDP-1, 2560x1600, auto, 1.6
        bind = $mainMod SHIFT, minus, exec, hyprctl keyword monitor eDP-1, 2560x1600, auto, 1
        bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
        bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
        bind = , XF86AudioMicMute, exec, amixer set Capture nocap
        bind = , XF86Launch1, exec, amixer set Capture cap
        bind = , XF86AudioRaiseVolume, exec, amixer sset Master 5%+
        bind = , XF86AudioLowerVolume, exec, amixer sset Master 5%-

        # Focus and workspace movement
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Switch workspaces
        bind = SUPER, 1, split:workspace, 1
        bind = SUPER, 2, split:workspace, 2
        bind = SUPER, 3, split:workspace, 3
        bind = SUPER, 4, split:workspace, 4
        bind = SUPER, 5, split:workspace, 5
        bind = SUPER, 6, split:workspace, 6
        bind = SUPER, 7, split:workspace, 7
        bind = SUPER, 8, split:workspace, 8
        bind = SUPER, 9, split:workspace, 9
        bind = SUPER, 0, split:workspace, 10

        # Move active window to a workspace
        bind = SUPER SHIFT, 1, split:movetoworkspacesilent, 1
        bind = SUPER SHIFT, 2, split:movetoworkspacesilent, 2
        bind = SUPER SHIFT, 3, split:movetoworkspacesilent, 3
        bind = SUPER SHIFT, 4, split:movetoworkspacesilent, 4
        bind = SUPER SHIFT, 5, split:movetoworkspacesilent, 5
        bind = SUPER SHIFT, 6, split:movetoworkspacesilent, 6
        bind = SUPER SHIFT, 7, split:movetoworkspacesilent, 7
        bind = SUPER SHIFT, 8, split:movetoworkspacesilent, 8
        bind = SUPER SHIFT, 9, split:movetoworkspacesilent, 9
        bind = SUPER SHIFT, 0, split:movetoworkspacesilent, 10

        bind = SUPER SHIFT, g, split:grabroguewindows

        # Special workspaces
        bind = $mainMod, N, togglespecialworkspace, magic
        bind = $mainMod SHIFT, N, movetoworkspace, special:magic

        # Scroll through workspaces
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

        # Launch services
        exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = hyprpm reload -n
        exec-once = systemctl --user start hyprpolkitagent
        exec-once = hyprpaper
        exec-once = nm-applet --indicator
        exec-once = waybar
        exec-once = swaync
        exec-once = syncthing
      '';
    };

    # Set session variables
    home.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    home.packages = with pkgs; [
      hyprland
      hyprpaper
      hyprpolkitagent
      hyprpicker
      hyprshot
      hyprcursor
      libnotify
      swaynotificationcenter
      wl-clipboard
      brightnessctl
      xcur2png
      wev
      xdg-desktop-portal-hyprland
      kdePackages.xwaylandvideobridge
    ];
  };
}
