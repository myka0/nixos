{pkgs, ...}: {
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      rb = "~/nixos/rebuild.sh";
      rbu = "~/nixos/rebuild-update.sh";
      nixos-test = "sudo nixos-rebuild test --flake ~/nixos/#default";
      fetch = "neowofetch";
      botany = "python3 ~/botany/botany.py";
    };
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
    grc
    fzf
    starship
  ];
}
