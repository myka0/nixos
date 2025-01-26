{
  config,
  lib,
  ...
}: {
  options = {nvidia.enable = lib.mkEnableOption "Enables Nvidia Drivers";};

  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.finegrained = true;
      nvidiaSettings = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:02:0";
        nvidiaBusId = "PCI:0:01:0";
      };
    };
  };
}
