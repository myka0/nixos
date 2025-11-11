{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      globals.mapleader = " ";

      keymaps = [
        # General
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

        # NvimTree
        {
          action = "<cmd>NvimTreeToggle<CR>";
          key = "<C-n>";
        }

        # Gitsigns
        {
          action = "<cmd>:Gitsigns toggle_word_diff<CR>";
          key = "<leader>gd";
        }

        # LspSaga
        {
          action = "<cmd>:Lspsaga code_action<CR>";
          key = "<leader>la";
        }
        {
          action = "<cmd>:Lspsaga rename<CR>";
          key = "<leader>lr";
        }
        {
          action = "<cmd>:Lspsaga finder<CR>";
          key = "<leader>lf";
        }
        {
          action = "<cmd>:Lspsaga outline<CR>";
          key = "<leader>lo";
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
          action = "<cmd>Telescope undo<CR>";
          key = "<leader>u";
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

        # GitConflict
        {
          action = "<cmd>GitConflictChooseOurs<CR>";
          key = "<leader>co";
        }
        {
          action = "<cmd>GitConflictChooseTheirs<CR>";
          key = "<leader>ct";
        }
        {
          action = "<cmd>GitConflictChooseBoth<CR>";
          key = "<leader>cb";
        }
        {
          action = "<cmd>GitConflictChooseNone<CR>";
          key = "<leader>cn";
        }
        {
          action = "<cmd>GitConflictNextConflict<CR>";
          key = "<leader>nc";
        }
        {
          action = "<cmd>GitConflictPrevConflict<CR>";
          key = "<leader>pc";
        }

        # LazyGit
        {
          action = "<cmd>LazyGit<CR>";
          key = "<leader>gg";
        }
        {
          action = "<cmd>LazyGitFilter<CR>";
          key = "<leader>gf";
        }
      ];
    };
  };
}
