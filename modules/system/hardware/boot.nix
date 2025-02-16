{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        theme = null;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };
}
