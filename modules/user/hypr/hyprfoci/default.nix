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
    hash = "sha256-K7xYYyuE9Y1/QlOxaYOt+o7WnhNDlXAc3Ms61jl1jI0=";
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
