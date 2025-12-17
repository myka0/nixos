{pkgs, ...}: {
  imports = [../../modules/user];

  # Modules
  nixvim.enable = true;
  hyprland.enable = true;
  teto-cursor.enable = false;
  bibata-cursor.enable = true;

  home.username = "myka";
  home.homeDirectory = "/home/myka";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
