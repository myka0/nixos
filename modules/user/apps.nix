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
    gimp-with-plugins
    gimpPlugins.gmic
    vlc
    lutris
    wineWow64Packages.waylandFull
    zoom-us
    unstable.blender
    electrum
    qbittorrent
    legcord
    ungoogled-chromium
    libreoffice
    aseprite
    krita
    xf86_input_wacom
    kdePackages.wacomtablet
    prismlauncher
    obsidian
    # pureref
    audacity
    via
    anki
    kicad
    openscad
    librecad
    dmenu

    # TUI Apps
    wget
    curl
    pv
    zip
    ffmpeg
    slurp
    wf-recorder
    fwupd
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
    cowsay
    cbonsai
    asciiquarium
    spotify-player
    codecrafters-cli
    openssl
    dysk
    alda

    # Utils
    libsecret
    gparted
    usbimager
    gnome-tweaks
    kdePackages.kdeconnect-kde
    xdg-utils
    protonup-qt
    protonplus
    protontricks
    syncthing
    xhosts
    xhost
    libxkbfile
    ntfs3g
    nfs-utils
    nix-ld
    clinfo
    vulkan-loader
    vulkan-validation-layers
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
