{
  xdg = {
    mime.enable = true;
    dataFile."applications/vortex-nxm.desktop".source = ./vortex-nxm.desktop;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "text/plain" = "kate.desktop";
        "text/x-csrc" = "kate.desktop";
        "text/x-chdr" = "kate.desktop";
        "text/x-c++src" = "kate.desktop";
        "text/x-c++hdr" = "kate.desktop";
        "application/x-shellscript" = "kate.desktop";
        "application/json" = "kate.desktop";
        "x-scheme-handler/nxm" = "vortex-nxm.desktop";
      };
    };
  };
}
