{
  config,
  pkgs,
  ...
}: let
  shimejiPkg = pkgs.stdenv.mkDerivation {
    pname = "spamton-shimeji";
    version = "1.0";

    src = pkgs.fetchgit {
      url = "https://codeberg.org/thatonecalculator/spamton-linux-shimeji.git";
      rev = "d967d78e13e12e2bf59f20c1a66c7f64d8d9310e";
      sha256 = "PNQZE4/RJ6C6qhAabMrbqEsYri0+GzbcwepCC6hMf1c=";
    };

    nativeBuildInputs = [pkgs.makeWrapper];

    buildInputs = [
      pkgs.jdk8
      pkgs.xorg.libX11
      pkgs.xorg.libXext
      pkgs.xorg.libXrender
      pkgs.xorg.libXtst
    ];

    installPhase = ''
      mkdir -p $out/share/spamton
      cp -r . $out/share/spamton

      mkdir -p $out/bin
      makeWrapper ${pkgs.jdk8}/bin/java $out/bin/spamton \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [
        pkgs.xorg.libX11
        pkgs.xorg.libXext
        pkgs.xorg.libXrender
        pkgs.xorg.libXtst
      ]}:${pkgs.jdk8}/jre/lib/amd64:${pkgs.jdk8}/jre/lib/amd64/server \
        --add-flags "-Xmx1000m \
          -classpath $out/share/spamton/Shimeji.jar \
          com.group_finity.mascot.Main \
          -Djava.util.logging.config.file=$out/share/spamton/conf/logging.properties \
          --module-path $out/share/spamton/javafx-sdk-11.0.2/lib \
          --add-modules=javafx.controls,javafx.fxml \
          --add-exports java.base/jdk.internal.misc=ALL-UNNAMED"
    '';
  };
in {
  home.packages = [shimejiPkg];

  home.file = {
    ".local/share/applications/spamton.desktop" = {
      source = "${shimejiPkg}/share/spamton/desktop/Spamton.desktop";
    };
    ".local/share/icons/hicolor/128x128/apps/spamton.png" = {
      source = "${shimejiPkg}/share/spamton/desktop/spamton.png";
    };
  };
}
