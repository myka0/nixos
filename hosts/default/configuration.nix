{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    inputs.home-manager.nixosModules.default
  ];

  nix = {
    # Lix package manager
    package = pkgs.lix;

    # Flakes
    settings.experimental-features = ["nix-command" "flakes"];

    # Garbage Collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    settings.auto-optimise-store = true;
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {"myka" = import ./home.nix;};
    backupFileExtension = "backup";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Modules
  auto-cpufreq.enable = true;
  asusctl.enable = true;
  gnome.enable = false;
  nvidia.enable = false;
  steam.enable = true;
  vfio.enable = true;

  # Run unpatched dynamic binaries
  programs.nix-ld.enable = true;

  # Set time zone
  time.timeZone = "America/Chicago";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define user account
  users.users.myka = {
    isNormalUser = true;
    description = "myka";
    extraGroups = ["networkmanager" "wheel" "vboxusers" "libvirtd" "jackaudio" "docker"];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_DEBUG_PLUGINS = 1;
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  system.stateVersion = "25.05";
}
