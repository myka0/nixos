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
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
        }
        {
          action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
          key = "<leader>fb";
        }
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>fg";
        }
        {
          action = "<cmd>Telescope spell_suggest<CR>";
          key = "<leader>ss";
        }
      ];
    };
  };
}
