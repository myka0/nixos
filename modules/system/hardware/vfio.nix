{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options = {
    vfio.enable =
      lib.mkEnableOption "Enables VFIO and other utilities for Virtualisation";
  };

  config = lib.mkIf config.vfio.enable {
    nixpkgs.config = {
      packageOverrides = pkgs: {
        old = import inputs.nixpkgs-old {
          inherit (pkgs) system;
          config.allowUnfree = true;
        };
      };
    };

    boot = {
      kernelParams = ["intel_iommu=on" "iommu=pt" "vfio-pci.ids=10de:2860,10de:22bd"];

      kernelModules = [
        "kvm-intel"
        "vfio_virqfd"
        "vfio_pci"
        "vfio_iommu_type1"
        "vfio"
        "evdi"
      ];

      extraModprobeConfig = ''
        options kvm_intel nested=1
        options kvm_intel emulate_invalid_guest_state=0
        options kvm ignore_msrs=1 report_ignored_msrs=0
        options vfio-pci ids=10de:2860,10de:22bd
        softdep nouveau pre: vfio-pci
        softdep nvidia pre: vfio-pci
        softdep nvidia* pre: vfio-pci
      '';

      blacklistedKernelModules = ["nvidia" "nouveau"];
    };

    systemd.tmpfiles.rules = ["f /dev/shm/looking-glass 0660 myka kvm -"];

    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          ovmf.enable = true;
          package = pkgs.old.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      old.libvirt
      old.virt-manager
      old.qemu_full
      old.qemu_kvm
      old.quickemu
      old.quickgui
      old.OVMFFull
      old.swtpm
      old.dnsmasq
      old.pciutils
      old.looking-glass-client
    ];
  };
}
