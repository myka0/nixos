{
  xdg = {
    mime.enable = true;
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
      };
    };
  };
}
