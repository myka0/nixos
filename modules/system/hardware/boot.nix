{
  config,
  pkgs,
  lib,
  ...
}: {
  boot = {
    # Custom linux kernel with patches
    kernelPackages = lib.mkForce (let
      linux_sgx_pkg = {
        fetchurl,
        buildLinux,
        ...
      } @ args:
        buildLinux (args
          // rec {
            version = "6.14.0-rc7";
            modDirVersion = version;

            src = fetchurl {
              url = "https://github.com/flukejones/linux/archive/refs/heads/wip/ally-6.14.tar.gz";
              hash = "sha256-wT323v3CBlkpZ+oHXppgplmn2tnq0MvvhPqs6DWp6I4=";
            };

            # Add rustfmt
            nativeBuildInputs = (args.nativeBuildInputs or []) ++ [pkgs.rustfmt];
          }
          // (args.argsOverride or {}));
      linux_sgx = pkgs.callPackage linux_sgx_pkg {};
    in
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_sgx));

    blacklistedKernelModules = [
      # Blacklist because of the bug in the typec_ucsi module that causes kworker to stuck:
      #   "INFO: task kworker/u96:1:12 blocked for more than 122 seconds."
      # The bug occurs when the external monitor is connected through USB-C. Laptop hangs after about 20 minutes,
      # and every 2 minutes error "task kworker blocked" occurs.
      # How to see error:
      # Kernel logs: journalctl -xb -p 3 -k
      # Kernel ring buffer: sudo dmesg
      # TODO: Remove when fixed
      "ucsi"
      "typec_ucsi"
      "roles"
      "typec"
      "ucsi_acpi"
    ];

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
