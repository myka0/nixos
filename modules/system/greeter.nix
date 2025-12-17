{pkgs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${tuigreet} --time --time-format '%a, %d %b %Y • %T' --greeting  '[Become Visible]' --asterisks --remember --cmd Hyprland'';
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen

    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
