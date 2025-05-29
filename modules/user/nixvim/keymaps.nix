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
          key = "<S-Tab>";
        }
        {
          action = "<cmd>bn<CR>";
          key = "<Tab>";
        }
        {
          action = "<cmd>bd<CR>";
          key = "<C-;>";
        }

        # Telescope
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
          key = "<leader>s";
        }
        {
          action = "<cmd>Telescope keymaps<CR>";
          key = "<leader>k";
        }
        {
          action = "<cmd>Telescope colorscheme<CR>";
          key = "<leader>cs";
        }
        {
          action = "<cmd>Telescope buffers<CR>";
          key = "<leader>b";
        }
        {
          action = "<cmd>Telescope git_status<CR>";
          key = "<leader>gs";
        }
        {
          action = "<cmd>Telescope git_commits<CR>";
          key = "<leader>gc";
        }
        {
          action = "<cmd>Telescope git_branches<CR>";
          key = "<leader>gb";
        }
      ];
    };
  };
}
