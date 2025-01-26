{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins = {
        lualine = {
          enable = true;
          settings = {
            theme = "gruvbox-material";

            sections = {
              lualine_a = ["mode"];
              lualine_b = ["branch" "diff" "diagnostics" "buffers"];
              lualine_c = [""];
              lualine_x = ["searchcount" "selectioncount"];
              lualine_y = ["encoding" "filetype"];
              lualine_z = ["progress" "location"];
            };

            componentSeparators = {
              left = "|";
              right = "|";
            };

            sectionSeparators = {
              left = "";
              right = "";
            };
          };
        };
      };
    };
  };
}
