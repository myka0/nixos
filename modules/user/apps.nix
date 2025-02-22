{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # GUI Apps
    inputs.zen-browser.packages.x86_64-linux.default
    nemo-with-extensions
    kitty
    firefox
    spotify
    gimp
    vlc
    moonlight-qt
    zoom-us
    blender
    electrum
    qbittorrent
    vesktop
    teams-for-linux
    ungoogled-chromium
    libreoffice
    krita
    obsidian
    via
    anki
    kicad
    openscad

    # TUI Apps
    wget
    curl
    zip
    unzip
    hyfetch
    btop
    qmk
    gay
    blahaj
    woeusb
    udisks
    texliveFull
    cowsay
    cbonsai
    asciiquarium
    openssl

    # Utils
    libsecret
    gparted
    gnome-tweaks
    gnome-disk-utility
    libsForQt5.kdeconnect-kde
    protonup-qt
    syncthing
    xhosts
    xorg.xhost
    xorg.libxkbfile
    ntfs3g
    nfs-utils
    appimage-run
    nix-ld
    clinfo
    vulkan-tools
    glxinfo
    pigz
    pbzip2
    zsync
    lshw
    dua
    kikit
    egl-wayland
    eglexternalplatform
    libGL
    valgrind
  ];
}
