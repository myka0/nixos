{pkgs, ...}: let
  pdWrapped = pkgs.puredata.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
    postInstall =
      (old.postInstall or "")
      + ''
        wrapProgram $out/bin/pd \
          --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib" \
          --set PIPEWIRE_RUNTIME_DIR "/run/user/$(id -u)"
      '';
  });
in {
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    pavucontrol
    paprefs
    alsa-utils
    pipewire
    pipewire.jack
    portaudio
    pdWrapped
    qpwgraph
  ];
}
