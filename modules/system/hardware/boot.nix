{
  config,
  pkgs,
  lib,
  ...
}: let
  g14_patches = fetchGit {
    url = "https://gitlab.com/asus-linux/linux-g14";
    ref = "7.0";
    rev = "d7f8b1c4d9557d901c5838bb9135c18a34337dd1";
  };
in {
  boot = {
    # Reduce atkbd-hid-asus conflicts
    kernelParams = [
      "atkbd.soft_raw=1"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

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
