{
  config,
  pkgs,
  lib,
  ...
}: {
  options.gnome.enable = lib.mkEnableOption "Enables Gnome";

  config = lib.mkIf config.gnome.enable {
    programs.dconf.enable = true;

    services.xserver = {
      desktopManager.gnome.enable = true;
      excludePackages = with pkgs; [
        xterm
        xdg-desktop-portal-gnome
        epiphany
        gedit
        simple-scan
        yelp
        evince
        gnome.geary
        gnome.seahorse
        gnome.gnome-calendar
        gnome.gnome-contacts
        gnome.gnome-maps
        gnome.gnome-music
        gnome.gnome-screenshot
        gnome.gnome-weather
        gnome-connections
      ];
    };
  };
}
