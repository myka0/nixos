{
  lib,
  meson,
  fetchFromGitHub,
  ninja,
  mkHyprlandPlugin,
  nix-update-script,
}:
mkHyprlandPlugin (finalAttrs: {
  pluginName = "hyprfoci";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "pohlrabi404";
    repo = "Hyprfoci";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8r3J85jh+9PSxl6hdeaq/ReS4aJm2d87/+luOT83mjs=";
  };

  patches = [
    ./version-check.patch
  ];

  nativeBuildInputs = [
    meson
    ninja
  ];

  passthru.updateScript = nix-update-script {};

  meta = {
    homepage = "https://github.com/pohlrabi404/Hyprfoci";
    license = lib.licenses.bsd3;
  };
})
