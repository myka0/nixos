{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Development Tools
    git
    gitlab-runner
    lazygit
    gotty
    spring-boot-cli
    godot
    gum
    vhs
    kubernetes
    kubernetes-helm
    kubectl
    bruno
    protobuf
    grpc
    grpcui
    re2
    openssl
    abseil-cpp
    libxml2
    jansson
    meson
    maven
    cmake
    gnumake
    libcap
    zlib
    openblas
    vagrant
    ansible
    pkg-config
    virtualenv
    devenv
    fuse3
    mesa
    dos2unix
    libhugetlbfs
    nix-prefetch-github

    # Languages
    alejandra
    treefmt
    rustc
    rustup
    uncrustify
    astyle
    black
    postgresql
    go
    golangci-lint
    delve
    nodejs
    gcc
    libgcc
    libcxx
    mpi
    racket
    jdk17
    python3

    # Editors
    kdePackages.kate
    vscode
  ];
}
