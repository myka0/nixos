{
  pkgs,
  inputs,
  ...
}: let
  wallpaper = ./wave.png;
  hyprpaper-old = inputs.nixpkgs-2511.legacyPackages.${pkgs.system}.hyprpaper;
in {
  services.hyprpaper = {
    enable = true;
    package = hyprpaper-old;
    settings = {
      preload = ["${wallpaper}"];
      wallpaper = [", ${wallpaper}"];
    };
  };
}
