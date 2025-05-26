{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins.lsp = {
        enable = true;
        inlayHints = true;

        servers = {
          clangd.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          volar.enable = true;
          tailwindcss.enable = true;
          pylsp.enable = true;
          jdtls.enable = true;

          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
        };

        luaConfig.post = ''
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })
        '';
      };
    };
  };
}
