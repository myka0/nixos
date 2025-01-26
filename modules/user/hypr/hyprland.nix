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

      settings = {
        input = {
          kb_layout = "us";

          follow_mouse = 1;
          mouse_refocus = "false";
          accel_profile = "flat";
          touchpad = {natural_scroll = "yes";};

          sensitivity = 0.2;
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

        decoration = {
          rounding = 8;

          blur = {
            enabled = false;
            size = 1;
            passes = 4;
            new_optimizations = true;
            xray = true;
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
        monitor = eDP-1, 2560x1600, auto, 1
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
        bind = $mainMod, B, exec, zen
        bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" screenshot.png
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
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10

        # Move active window to a workspace
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

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
        exec-once = systemctl --user start hyprpolkitagent
        exec-once = hyprpaper
        exec-once = nm-applet --indicator
        exec-once = waybar
        exec-once = dunst
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
      dunst
      libnotify
      slurp
      grim
      wl-clipboard
      brightnessctl
      wev
      xwaylandvideobridge
      xdg-desktop-portal-hyprland
    ];
  };
}
