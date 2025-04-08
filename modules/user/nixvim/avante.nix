{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      plugins.avante = {
        enable = true;
        settings = {
          hints.enabled = false;
        };
      };
    };
  };
}
