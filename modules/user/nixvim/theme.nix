{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      highlightOverride = {
        lualine_c_buffers_active.underline = true;

        CurrentWord = {
          bg = null;
          underline = true;
        };

        MiniStarterQuery.fg = "#fb4934";
        MiniStarterHeader.fg = "#699D6A";
        MiniStarterFooter.fg = "#B16286";
        MiniStarterSection.fg = "#fe8019";
        MiniStarterItemPrefix.fg = "#458588";
      };

      colorscheme = "gruvbox-material";

      extraPlugins = with pkgs; [vimPlugins.gruvbox-material];

      extraConfigLua = ''
        if vim.fn.has('termguicolors') == 1 then
          vim.opt.termguicolors = true
        end

        vim.opt.background = 'dark'
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_foreground = 'material'
        vim.cmd('colorscheme gruvbox-material')
      '';
    };
  };
}
