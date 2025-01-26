{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      globals.mapleader = " ";

      keymaps = [
        {
          action = "<cmd>NvimTreeToggle<CR>";
          key = "<C-n>";
        }
        {
          action = "<cmd>bp<CR>";
          key = "<C-[>";
        }
        {
          action = "<cmd>bn<CR>";
          key = "<C-]>";
        }
        {
          action = "<cmd>bd<CR>";
          key = "<C-;>";
        }
      ];
    };
  };
}
