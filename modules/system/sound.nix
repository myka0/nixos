{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.jack = {
    jackd.enable = false;

    # support ALSA only programs via ALSA JACK PCM plugin
    alsa.enable = false;

    # support ALSA only programs via loopback device (supports programs like Steam)
    loopback.enable = false;
  };

  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [pavucontrol paprefs alsa-utils];
}
