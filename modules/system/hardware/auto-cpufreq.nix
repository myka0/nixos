{
  config,
  lib,
  ...
}: {
  options = {
    auto-cpufreq.enable = lib.mkEnableOption "Enables auto-cpufreq";
  };

  config = lib.mkIf config.auto-cpufreq.enable {
    boot.kernelParams = ["intel_pstate=disable"];
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
        scaling_min_freq = 800000;
        scaling_max_freq = 2800000;
      };

      battery = {
        governor = "powersave";
        turbo = "auto";
        scaling_min_freq = 400000;
        scaling_max_freq = 2600000;
      };
    };
  };
}
