{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins = {
        nvim-tree = {
          enable = true;
          autoClose = true;
        };
      };

      extraConfigLua = ''
        require('nvim-tree').setup {
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
        }
      '';
    };
  };
}
