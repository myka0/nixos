{pkgs, ...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 10;
        margin-bottom = 0;
        margin-top = 0;

        modules-left = ["temperature" "cpu" "memory" "network" "mpd" "hyprland/window"];

        modules-center = ["hyprland/workspaces"];

        modules-right = ["tray" "pulseaudio" "backlight" "battery" "clock"];

        # Left Modules
        temperature = {
          interval = 10;
          thermal-zone = 7;
          warn-temperature = 65;
          critical-threshold = 85;
          format = " {temperatureC}°C";
          on-click = "kitty -e 'btop'";
          tooltip = false;
        };

        cpu = {
          format = " &#8239;{usage}%";
          tooltip = false;
          on-click = "kitty -e 'btop'";
        };

        memory = {
          interval = 10;
          format = " {used:0.2f}GB";
          max-length = 10;
          tooltip = false;
          warning = 10;
          critical = 90;
        };

        network = {
          interval = 2;
          format-wifi = "  {signalStrength}%";
          format-ethernet = "";
          format-linked = " {ipaddr}";
          format-disconnected = " Disconnected";
          format-disabled = "";
          tooltip = false;
          max-length = 20;
          min-length = 6;
          format-alt = "{essid}";
        };

        mpd = {
          format = "{stateIcon} {artist} - {title}";
          format-disconnected = "🎶";
          format-stopped = "♪";
          interval = 10;
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
          max-length = 35;

          consume-icons = {on = " ";};

          random-icons = {
            off = ''<span color="#f53c3c"></span> '';
            on = " ";
          };

          repeat-icons = {on = " ";};

          single-icons = {on = "1 ";};

          state-icons = {
            paused = "";
            playing = "";
          };
        };

        # Middle Modules
        "hyprland/workspaces" = {
          sort-by-name = true;
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 200;
          separate-outputs = true;
        };

        # Right Modules
        tray = {
          icon-size = 16;
          spacing = 6;
        };

        pulseaudio = {
          on-click = "pavucontrol";
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = " {format_source}";
          format-muted = "  {format_source}";
          format-source = "  {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = " ";
            headset = "🎧";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };

        backlight = {
          format = "{icon}&#8239;{percent}%";
          format-icons = ["" ""];
          on-scroll-down = "brightnessctl -c backlight set 1%-";
          on-scroll-up = "brightnessctl -c backlight set +1%";
          on-click = "brightnessctl -c backlight set 1%-";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{icon}&#8239;{capacity}%";
          format-charging = "&#8239;{capacity}%";
          format-plugged = "&#8239;{capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [" " " " " " " " " "];
        };

        clock = {
          locale = "C";
          format = " {:%I:%M %p}";
          format-alt = " {:%a,%b %d}";
        };
      };
    };

    style = ''
      * {
        font-family: JetBrainsMono;
        font-size: 13px;
        min-height: 0;
        color: white;
      }

      window#waybar {
        background-color: rgba(20, 20, 20, 0.8);
      }

      #workspaces {
        margin-top: 3px;
        margin-bottom: 3px;
        margin-right: 10px;
        margin-left: 25px;
      }

      #workspaces button {
        border-radius: 8px;
        margin-right: 8px;
        padding: 1px 10px;
        font-weight: bolder;
        background-color: #272727;
      }

      #workspaces button.active, #workspaces button.focused {
        padding: 0 10px;
        /* box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset; */
        background: #6791C9;
      }

      #tray,
      #mpd,
      #custom-weather,
      #cpu,
      #temperature,
      #memory,
      #sway-mode,
      #backlight,
      #pulseaudio,
      #custom-vpn,
      #disk,
      #custom-recorder,
      #custom-audiorec,
      #battery,
      #clock,
      #network {
      	padding: 0 12px;
      }

      #memory.warning,
      #battery.warning {
        color: #f8971d;
      }

      #memory.critical,
      #battery.critical,
      #temperature.critical {
        color: #F53C3C;
      }
    '';
  };
}
