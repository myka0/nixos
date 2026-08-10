{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  options = {steam.enable = lib.mkEnableOption "Enables Steam";};

  config = lib.mkIf config.steam.enable {
    nixpkgs.config = {
      packageOverrides = pkgs: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (pkgs) system;
          config.allowUnfree = true;
        };
      };
    };

    programs.steam = {
      enable = true;
      package = pkgs.unstable.steam;

      # Open ports in the firewall for Steam Remote Play
      remotePlay.openFirewall = true;

      # Open ports in the firewall for Source Dedicated Server
      dedicatedServer.openFirewall = true;

      # Open ports in the firewall for Steam Local Network Game Transfers
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
