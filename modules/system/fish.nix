{pkgs, ...}: {
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      nixos-test = "sudo nixos-rebuild test --flake ~/nixos/#default";
      fetch = "neowofetch";
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
