{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (pkgs) system;
        config.allowUnfree = true;
      };
    };
  };

  home.packages = with pkgs; [
    # GUI Apps
    inputs.zen-browser.packages.x86_64-linux.default
    nemo-with-extensions
    kitty
    firefox
    gimp
    vlc
    lutris
    wineWowPackages.waylandFull
    moonlight-qt
    zoom-us
    unstable.blender
    electrum
    qbittorrent
    vesktop
    ungoogled-chromium
    libreoffice
    aseprite
    krita
    xf86_input_wacom
    kdePackages.wacomtablet
    obsidian
    audacity
    via
    anki
    kicad
    openscad
    wireshark
    dmenu

    # TUI Apps
    wget
    curl
    pv
    zip
    ffmpeg
    slurp
    wf-recorder
    p7zip
    tldr
    unzip
    hyfetch
    btop
    qmk
    gay
    blahaj
    dmg2img
    woeusb
    udisks
    dust
    texliveFull
    cowsay
    cbonsai
    asciiquarium
    spotify-player
    openssl
    dysk

    # Utils
    libsecret
    gparted
    gnome-tweaks
    kdePackages.kdeconnect-kde
    xdg-utils
    protonup-qt
    protonplus
    protontricks
    syncthing
    xhosts
    xorg.xhost
    xorg.libxkbfile
    ntfs3g
    nfs-utils
    nix-ld
    clinfo
    vulkan-tools
    mesa-demos
    pigz
    pbzip2
    zsync
    lshw
    dua
    kikit
    egl-wayland
    eglexternalplatform
    libGL
  ];
}
