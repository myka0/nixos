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

    kernelPackages = pkgs.linuxPackages_7_0;
    kernelPatches = map (patch: {inherit patch;}) [
      # asus-armoury model support patches
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-FA507UV.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-FA608UM.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-G615LR.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-G835LW.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-GA403WR.patch"
      "${g14_patches}/0003-0-4-platform-x86-asus-armoury-ppt-fixes-and-new-models.patch"
      "${g14_patches}/0001-platform-x86-asus-armoury-add-support-for-FX608JMR.patch"

      # ACPI / power management patches
      "${g14_patches}/0001-acpi-proc-idle-skip-dummy-wait.patch"
      "${g14_patches}/0070-acpi-x86-s2idle-Add-ability-to-configure-wakeup-by-A.patch"

      # backlight / display patches
      "${g14_patches}/PATCH-asus-wmi-fixup-screenpad-brightness.patch"
      "${g14_patches}/0084-enable-steam-deck-hdr.patch"

      # tablet mode patches
      "${g14_patches}/sys-kernel_arch-sources-g14_files-0047-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch"
      "${g14_patches}/sys-kernel_arch-sources-g14_files-0048-asus-nb-wmi-fix-tablet_mode_sw_int.patch"

      # audio fixes
      "${g14_patches}/ga403wr-fix-audio.patch"

      # battery patches
      "${g14_patches}/0001-platform-asus-wmi-do-not-enforce-battery.patch"
      "${g14_patches}/0002-g614fp.patch"

      # lamparray support
      "${g14_patches}/v4-0001-lamparray.patch"
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
