{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options = {
    asusctl.enable =
      lib.mkEnableOption "Enables Asusctl and ROG control center";
  };

  config = lib.mkIf config.asusctl.enable {
    nixpkgs.config = {
      packageOverrides = pkgs: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (pkgs) system;
          config.allowUnfree = true;
        };
      };
    };

    services.supergfxd.enable = true;
    systemd.services.supergfxd.path = [pkgs.kmod pkgs.pciutils];
    services = {
      asusd = {
        enable = true;
        enableUserService = true;
      };
    };

    programs.rog-control-center = {
      enable = true;
      autoStart = true;
    };

    systemd.services.asusd = {
      serviceConfig = {
        ExecStart = ["" "${pkgs.unstable.asusctl}/bin/asusd"];
      };
    };

    environment.systemPackages = with pkgs.unstable; [asusctl];
  };
}
