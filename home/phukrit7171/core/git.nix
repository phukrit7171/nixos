{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Mr.Phukrit Kittinontana";
      user.email = "phukrit7171@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    includes = [
      {
        condition = "gitdir:/home/phukrit7171/Development/bu8";
        contents = {
          user.email = "phukrit.k@chanwanich.digital";
        };
      }
    ];
  };
}
