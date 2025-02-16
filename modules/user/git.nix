{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "myka0";
    userEmail = "mykamayer0@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "${
        pkgs.git.override {withLibsecret = true;}
      }/bin/git-credential-libsecret";
    };
  };
}
