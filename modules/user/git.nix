{
  programs.git = {
    enable = true;
    userName = "myka0";
    userEmail = "mykamayer0@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "libsecret";
    };
  };
}
