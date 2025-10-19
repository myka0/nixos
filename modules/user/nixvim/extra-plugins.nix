{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      extraPlugins = [
        (pkgs.vimUtils.buildVimPlugin {
          name = "pets.nvim";
          src = pkgs.fetchFromGitHub {
            owner = "ApoorvShah";
            repo = "pets.nvim";
            rev = "bfd1c5c7708468bc8407ce18baeb237986bf6026";
            hash = "sha256-Iv2hkDluDIc17xtfhGc7z7mfK1emtYIQOwUHobSd8Z0=";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          name = "hologram.nvim";
          src = pkgs.fetchFromGitHub {
            owner = "giusgad";
            repo = "hologram.nvim";
            rev = "c91aa77121162d8ff554b18a487a3f60677447f2";
            hash = "sha256-rNffTS63oSTuBEjN86SijQTrbloQZySfFYy7N0Oyw/8=";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          name = "nui.nvim";
          src = pkgs.fetchFromGitHub {
            owner = "MunifTanjim";
            repo = "nui.nvim";
            rev = "de740991c12411b663994b2860f1a4fd0937c130";
            hash = "sha256-41slmnvt1z7sCxvpiVuFmQ9g7eCaxQi1dDCL3AxSL1A=";
          };
        })
      ];

      extraConfigLua = ''
        require("pets").setup({
          row = 1,
          col = 0,
          speed_multiplier = 1,
          default_pet = "cat",
          default_style = "black",
          random = false,
          death_animation = true,
          popup = {
            width = "30%",
            winblend = 100,
            hl = { Normal = "Normal" },
            avoid_statusline = false,
          },
        })
      '';
    };
  };
}
