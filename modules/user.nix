{
  inputs,
  pkgs,
  self,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.phukrit7171 = import "${self}/home/phukrit7171/home.nix";
  };

  users.users.phukrit7171 = {
    isNormalUser = true;
    description = "Phukrit Kittinontana";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "plugdev"
      "scanner"
      "lpadmin"
      "lp"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
