{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins.mini.enable = true;

      extraConfigLua = ''
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.operators').setup()
        require('mini.pairs').setup()
        require('mini.bracketed').setup()
        require('mini.files').setup()
      '';
    };
  };
}
