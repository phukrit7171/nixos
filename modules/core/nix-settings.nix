{ inputs, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [ "https://install.determinate.systems" ];
    extra-trusted-public-keys = [
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
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
}
