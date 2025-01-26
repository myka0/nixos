{pkgs, ...}: {
  imports = [../../modules/user];

  # Modules
  nixvim.enable = true;
  hyprland.enable = true;

  home.username = "myka";
  home.homeDirectory = "/home/myka";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
