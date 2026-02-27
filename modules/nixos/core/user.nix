{
  pkgs,
  config,
  lib,
  ...
}:

{
  options.modules.core.user.enable = lib.mkEnableOption "Core User Configuration";

  config = lib.mkIf config.modules.core.user.enable {
    users.users.phukrit7171 = {
      isNormalUser = true;
      description = "Phukrit Kittinontana";
      extraGroups = [
        "networkmanager"
        "wheel"
        "dialout"
        "scanner"
        "lpadmin"
        "lp"
      ];
      shell = pkgs.fish;
    };
  };
}
