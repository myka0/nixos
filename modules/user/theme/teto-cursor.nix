{
  config,
  pkgs,
  lib,
  ...
}: let
  tetoCursor = pkgs.stdenvNoCC.mkDerivation {
    pname = "TetoCursor";
    version = "0.1";

    src = ./TetoCursor.zip;
    nativeBuildInputs = [pkgs.unzip];
    dontUnpack = true;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/icons
      unzip -qq "$src" -d $out/share/icons
    '';
  };
in {
  config = lib.mkIf config.teto-cursor.enable {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "TetoCursor";
      package = tetoCursor;
      hyprcursor = {
        enable = true;
        size = 32;
      };
    };
  };
}
