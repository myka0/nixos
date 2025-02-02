{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins.mini.enable = true;

      extraConfigLua = ''
        local function custom_header()
          local ascii_header = ([[

            ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
            ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
            ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

          ]]):gsub("\n%s+", "\n")

          local hour = tonumber(vim.fn.strftime('%H'))
          local part_id = math.floor((hour + 4) / 8) + 1
          local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
          local username = vim.loop.os_get_passwd()['username'] or 'USERNAME'
          local greeting = ('Good %s, %s'):format(day_part, username)

          return ascii_header .. "\n" .. greeting
        end

        local animate = require('mini.animate')
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.operators').setup()
        require('mini.pairs').setup()
        require('mini.bracketed').setup()
        require('mini.trailspace').setup()
        require('mini.indentscope').setup({
          delay = 50,
        })

        local starter = require('mini.starter')
        starter.setup({
          header = custom_header(),
          footer = 'Made with  .',
          items = {
            starter.sections.telescope(),
            starter.sections.recent_files(10, false, false),
            starter.sections.builtin_actions(),
          },
          content_hooks = {
            starter.gen_hook.adding_bullet(),
            starter.gen_hook.aligning('center', 'center'),
          },
        })
      '';
    };
  };
}
