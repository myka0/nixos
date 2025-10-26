{pkgs, ...}: let
  scripts = {
    remind = ./remind.sh;
    record-region = ./record-region.sh;
    record-window = ./record-window.sh;
  };

  mkApp = name: path:
    pkgs.writeShellApplication {
      inherit name;
      runtimeInputs = [
        pkgs.wf-recorder
        pkgs.wl-clipboard
        pkgs.libnotify
        pkgs.slurp
        pkgs.jq
        pkgs.ffmpeg
        pkgs.gifsicle
        pkgs.hyprland
      ];
      text = builtins.readFile path;
    };
in {
  home.packages = builtins.attrValues (pkgs.lib.mapAttrs mkApp scripts);
}
