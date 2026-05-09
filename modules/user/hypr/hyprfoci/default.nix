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
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "pohlrabi404";
    repo = "Hyprfoci";
    rev = "bffbd8b2d2cf91e8ad1a834fe74efc68d18e540c";
    hash = "sha256-R4PuZgkmq3tLWex0ovHZOegUg4k64CBzYd8z1EsVuwo=";
  };

  # patches = [
  #   ./version-check.patch
  # ];

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
