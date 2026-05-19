{ pkgs, lib, ... }:

let
  secretsFile = ../../../secrets/secrets.yaml;
  hasSecrets = builtins.pathExists secretsFile;
in
{
  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];

  sops.defaultSopsFile = lib.mkIf hasSecrets secretsFile;
  sops.defaultSopsFormat = lib.mkIf hasSecrets "yaml";
  sops.age.keyFile = lib.mkIf hasSecrets "/home/phukrit7171/.config/sops/age/keys.txt";
}
