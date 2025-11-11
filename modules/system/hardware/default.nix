{
  imports = [./auto-cpufreq.nix ./asusctl.nix ./boot.nix ./nvidia.nix ./vfio.nix];

  swapDevices = [
    {
      device = "/swapfile";
      size = 8192;
    }
  ];

  programs.ssh.startAgent = true;

  security.rtkit.enable = true;

  systemd.services."NetworkManager-wait-online".enable = false;
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.scanRandMacAddress = false;
    firewall.enable = false;
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

    postgresql.enable = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["modesetting"];

    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";
  };
}
