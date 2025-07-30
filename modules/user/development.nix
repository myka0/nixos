{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Development Tools
    git
    gitlab-runner
    gum
    vhs
    bruno
    libxml2
    jansson
    meson
    maven
    cmake
    gnumake
    libcap
    zlib
    openblas
    pkg-config
    virtualenv
    devenv
    fuse3
    mesa
    libhugetlbfs

    # Languages
    alejandra
    treefmt
    rustc
    rustup
    uncrustify
    astyle
    postgresql
    go
    golangci-lint
    delve
    nodejs
    gcc
    libgcc
    libcxx
    racket
    jdk17
    python3

    # Editors
    kdePackages.kate
    jetbrains.pycharm-community
    jetbrains.rider
    vscodium
    azuredatastudio

    # Hints
    ydotool
    pipx
    cairo
    gobject-introspection
    gtk-layer-shell
  ];
}
