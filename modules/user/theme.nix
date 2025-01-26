{pkgs, ...}: {
  # QT Themes
  systemd.user.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
  systemd.user.sessionVariables.QT_DEBUG_PLUGINS = 1;
  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "qt5ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly-Nord-Plasma";
    };
  };

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    tela-icon-theme
    gtk3
    gtk4
    orchis-theme
    layan-gtk-theme
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
}
