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
    libxml2
    jansson
    meson
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
    treefmt2
    rustc
    rustup
    uncrustify
    astyle
    go
    nodejs
    gcc
    libgcc
    libcxx
    racket
    jdk17
    python3

    # Editors
    kate
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
