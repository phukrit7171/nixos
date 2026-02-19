{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/dev.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.phukrit7171 = import ../../home/phukrit7171/home.nix;
    extraSpecialArgs = { inherit inputs; };
  };

  # =================================================================
  # STATE VERSION
  # =================================================================
  system.stateVersion = "25.11";
}
