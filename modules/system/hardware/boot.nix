{
  config,
  pkgs,
  lib,
  ...
}: let
  g14_patches = fetchGit {
    url = "https://gitlab.com/asus-linux/linux-g14";
    ref = "6.18";
    rev = "35bffaf767dd85280adc54958038dbe9d8041d68";
  };
in {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;
    kernelPatches = map (patch: {inherit patch;}) [
      "${g14_patches}/0001-platform-x86-asus-wmi-export-symbols-used-for-read-w.patch"
      "${g14_patches}/0002-platform-x86-asus-armoury-move-existing-tunings-to-a.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-panel_hd_mode-attribut.patch"
      "${g14_patches}/0004-platform-x86-asus-armoury-add-apu-mem-control-suppor.patch"
      "${g14_patches}/0005-platform-x86-asus-armoury-add-screen-auto-brightness.patch"
      "${g14_patches}/0006-platform-x86-asus-wmi-deprecate-bios-features.patch"
      "${g14_patches}/0007-platform-x86-asus-wmi-rename-ASUS_WMI_DEVID_PPT_FPPT.patch"
      "${g14_patches}/0008-platform-x86-asus-armoury-add-ppt_-and-nv_-tuning-kn.patch"
      "${g14_patches}/0001-platform-x86-asus-armoury-Fix-error-code-in-mini_led.patch"
      "${g14_patches}/0002-platform-x86-asus-armoury-fix-mini-led-mode-show.patch"
      "${g14_patches}/0003-platform-x86-asus-armoury-add-support-for-FA507UV.patch"
      "${g14_patches}/0001-platform-x86-asus-armoury-fix-only-DC-tunables-being.patch"

      "${g14_patches}/PATCH-v10-00-11-HID-asus-Fix-ASUS-ROG-Laptop-s-Keyboard-backlight-handling.patch"
      "${g14_patches}/PATCH-v10-00-11-HID-asus-Fix-ASUS-ROG-Laptop-s-Keyboard-backlight-handling-id1-id2-pr_err.patch"

      "${g14_patches}/0001-platform-x86-asus-wmi-fix-initializing-TUFs-keyboard.patch"
      "${g14_patches}/0002-platform-x86-asus-armoury-add-keyboard-control-firmw.patch"

      "${g14_patches}/0001-acpi-proc-idle-skip-dummy-wait.patch"
      "${g14_patches}/PATCH-v5-00-11-Improvements-to-S5-power-consumption.patch"
      "${g14_patches}/PATCH-asus-wmi-fixup-screenpad-brightness.patch"

      "${g14_patches}/asus-patch-series.patch"

      "${g14_patches}/0070-acpi-x86-s2idle-Add-ability-to-configure-wakeup-by-A.patch"

      "${g14_patches}/0040-workaround_hardware_decoding_amdgpu.patch"
      "${g14_patches}/0081-amdgpu-adjust_plane_init_off_by_one.patch"

      "${g14_patches}/0084-enable-steam-deck-hdr.patch"
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
