{
  imports = [./auto-cpufreq.nix ./asusctl.nix ./boot.nix ./nvidia.nix ./vfio.nix];

  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    hostName = "onyx";
  };

  hardware = {
    # Enables proprietary firmware for enhanced hardware support
    enableRedistributableFirmware = true;

    # QMK
    keyboard.qmk.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Better scheduling for CPU cycles - thanks System76!!!
    system76-scheduler.settings.cfsProfiles.enable = true;

    # Enable thermald (only necessary if on Intel CPUs)
    thermald.enable = true;

    # Lid Switch
    logind.lidSwitch = "ignore";
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["modesetting"];

    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";
  };
}
