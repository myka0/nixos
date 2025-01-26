{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options = {supermaven.enable = lib.mkEnableOption "Enables Supermaven";};

  config = lib.mkIf config.supermaven.enable {
    programs.nixvim = {
      extraPlugins = with pkgs; [vimPlugins.supermaven-nvim];

      extraConfigLua = ''
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<C-CR>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
          },
        })
      '';
    };
  };
}
