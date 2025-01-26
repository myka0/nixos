{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins.cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];

          mapping = {
            "<CR>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.mapping.confirm({ select = true })
                elseif cmp.visible() and luasnip.expandable() then
                  luasnip.expand()
                elseif cmp.visible() and luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() and check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';

            "<Tab>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif cmp.visible() and luasnip.expandable() then
                  luasnip.expand()
                elseif cmp.visible() and luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() and check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';

            "<S-Tab>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif cmp.visible() and luasnip.expandable() then
                  luasnip.expand()
                elseif cmp.visible() and luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() and check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
          };
        };
      };
    };
  };
}
