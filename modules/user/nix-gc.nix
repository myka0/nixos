{pkgs, ...}: {
  systemd.user.services.nix-gc = {
    Unit.Description = "Prune Nix profile generations older than two weeks";
    Service = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "nix-gc-user" ''
        for profile in profile home-manager; do
          ${pkgs.lix}/bin/nix-env \
            --profile "$HOME/.local/state/nix/profiles/$profile" \
            --delete-generations 14d || true
        done
      '';
    };
  };

  systemd.user.timers.nix-gc = {
    Unit.Description = "Prune Nix profile generations older than two weeks";
    Timer = {
      OnCalendar = "daily";
      Persistent = true;
    };
    Install.WantedBy = ["timers.target"];
  };
}
