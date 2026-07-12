{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
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
      {
        src = pkgs.fetchFromGitHub {
          owner = "Xndr2";
          repo = "listening-stats";
          rev = "5507c91120ae7f06b702ff4ef4f55df058770527";
          hash = "sha256-sChfQWrTuZ3TgPvstNSOh1ytOtU0Iel29S1uXLilKzU=";
        };
        name = "listening-stats";
      }
    ];
    enabledSnippets = with spicePkgs.snippets; [
      pointer
    ];
  };
}
