{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      colorscheme = "gruvbox-material";

      extraPlugins = with pkgs; [vimPlugins.gruvbox-material];

      extraConfigLua = ''
        if vim.fn.has('termguicolors') == 1 then
          vim.opt.termguicolors = true
        end

        vim.opt.background = 'dark'
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_foreground = 'original'
        vim.cmd('colorscheme gruvbox-material')
      '';
    };
  };
}
