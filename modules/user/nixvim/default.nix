{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./nvim-tree.nix
    ./supermaven.nix
    ./theme.nix
  ];

  options = {nixvim.enable = lib.mkEnableOption "Enables Nixvim";};

  config = lib.mkIf config.nixvim.enable {
    supermaven.enable = false;
    programs.neovim.defaultEditor = true;
    programs.nixvim = {
      enable = true;
      clipboard.register = "unnamedplus";

      opts = {
        number = true;
        relativenumber = true;
        cursorline = true;

        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        autoindent = true;
      };

      extraPlugins = with pkgs; [
        vimPlugins.comment-nvim
        vimPlugins.neoformat
      ];

      plugins = {
        indent-blankline.enable = true;
        telescope.enable = true;
        treesitter.enable = true;
        web-devicons.enable = true;
        improved-search.enable = true;
        markdown-preview.enable = true;
        typescript-tools.enable = true;
        nvim-autopairs.enable = true;
        vim-css-color.enable = true;
        cmp-buffer.enable = true;
        ts-autotag.enable = true;
        hardtime.enable = true;
        luasnip.enable = true;
        oil.enable = true;

        nvim-jdtls = {
          enable = true;
          data = "/home/myka";
        };

        lspsaga = {
          enable = true;
          ui.devicon = true;
        };

        none-ls = {
          enable = true;
          sources.formatting.prettier.enable = true;
          sources.formatting.prettier.disableTsServerFormatter = false;
        };
      };
    };
  };
}
