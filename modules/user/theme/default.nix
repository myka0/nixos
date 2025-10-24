{
  pkgs,
  lib,
  ...
}: {
  options = {
    bibata-cursor.enable = lib.mkEnableOption "Enables Bibata Cursor";
    teto-cursor.enable = lib.mkEnableOption "Enables Teto Cursor";
  };

  config = {
    # QT Themes
    systemd.user.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";
    systemd.user.sessionVariables.QT_DEBUG_PLUGINS = 1;
    nixpkgs.config.qt6 = {
      enable = true;
      platformTheme = "qt6ct";
      style = {
        package = pkgs.utterly-nord-plasma;
        name = "Utterly-Nord-Plasma";
      };
    };

    home.packages = with pkgs; [
      networkmanagerapplet
      tela-icon-theme
      gtk3
      gtk4
      orchis-theme
      layan-gtk-theme
      catppuccin-kvantum
      gruvbox-kvantum
      rose-pine-kvantum
      kdePackages.qt6ct
      kdePackages.qtstyleplugin-kvantum
      themechanger
    ];
  };
}
