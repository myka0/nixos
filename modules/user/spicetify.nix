{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = spicePkgs.themes.text;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
      historyInSidebar
      marketplace
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];
  };
}
