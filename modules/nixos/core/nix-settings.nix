{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  options.modules.core.nix.enable = lib.mkEnableOption "Core Nix Configuration";

  config = lib.mkIf config.modules.core.nix.enable {
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      max-jobs = "auto";
      cores = 0;
      compress-build-log = true;
    };

    environment.systemPackages = [ pkgs.nh ];

    # GARBAGE COLLECTION
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # PIN NIXPKGS
    nix.registry.nixpkgs.flake = inputs.nixpkgs;
    nixpkgs.config.allowUnfree = true;
  };
}
