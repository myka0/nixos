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
              lualine_b = ["branch" "diagnostics"];
              lualine_c = [
                {
                  __unkeyed-1 = "buffers";
                  symbols = {
                    alternate_file = "";
                  };
                }
              ];
              lualine_x = ["searchcount" "selectioncount" "diff"];
              lualine_y = ["filetype"];
              lualine_z = ["progress" "location"];
            };

            options = {
              component_separators = {
                left = "";
                right = "";
              };

              section_separators = {
                left = "";
                right = "";
              };
            };
          };
        };
      };
    };
  };
}
