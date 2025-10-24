{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.bibata-cursor.enable {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 32;
    };
  };
}
