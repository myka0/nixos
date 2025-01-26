let
  wallpaper = ./wave.png;
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${wallpaper}"];
      wallpaper = [", ${wallpaper}"];
    };
  };
}
