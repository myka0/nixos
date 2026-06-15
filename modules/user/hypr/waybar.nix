{pkgs, ...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 34;
        margin-bottom = 0;
        margin-top = 0;

        modules-left = ["custom/icon" "temperature" "cpu" "memory" "network" "mpd"];

        modules-center = ["hyprland/workspaces"];

        modules-right = ["tray" "pulseaudio" "backlight" "battery" "clock"];

        # Left Modules
        "custom/icon" = {
          format = " ";
        };

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
          on-click = "kitty -e 'btop'";
        };

        network = {
          format-disconnected = "󰖪 0% ";
          format-ethernet = "󰈀 100% ";
          format-linked = "{ifname} (No IP)";
          format-wifi = "  {signalStrength}%";
          tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
          on-click = "kitty nmtui";
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
          all-outputs = false;
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 7;
          };
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
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            headset = " ";
            default = ["" " " " "];
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
        min-height: 0;
        color: white;
      }

      window#waybar {
        background-color: rgba(18, 18, 18, 0.5);
      }

      #workspaces {
        background: #202020;
        margin: 6px 4px;
        padding: 7px 16px;
        border-radius: 16px;
        font-size: 2px;
      }

      #workspaces button {
        font-weight: bold;
        font-size: 2px;
        padding: 2px 0px;
        margin: 0px 12px;
        background-color: #dc4058;
        border-radius: 16px;
        min-width: 12px;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
        font-weight: bold;
        font-size: 2px;
        margin: 0px 8px;
        background-color: #dc4058;
        border-radius: 16px;
        min-width: 32px;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
        font-weight: bold;
        font-size: 2px;
        margin: 0px 16px;
        border-radius: 16px;
        min-width: 8px;
        background-color: #2C2C2C;
        transition: all 0.3s ease-in-out;
      }

      #custom-icon {
        color: #dc4058;
        background: #202020;
        margin: 0px 5px 0px 0px;
        padding: 0px 20px 0px 8px;
        border-radius: 0px 0px 40px 0px;
        font-size: 24px;
      }

      #tray,
      #backlight,
      #pulseaudio,
      #battery {
        background-color: #202020;
        border-radius: 10px 24px 10px 24px;
        padding: 0 20px;
        margin: 3px 0px 3px 5px;
        font-size: 14px;
      }

      #mpd,
      #cpu,
      #temperature,
      #memory,
      #network {
        background-color: #202020;
        border-radius: 24px 10px 24px 10px;
        padding: 0 20px;
        margin: 3px 5px 3px 0px;
        font-size: 14px;
      }

      #clock {
        background: #202020;
        border-radius: 0px 0px 0px 40px;
        padding: 0px 10px 0px 25px;
        margin: 0px 0px 0px 5px;
        font-weight: bold;
        font-size: 14px;
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
