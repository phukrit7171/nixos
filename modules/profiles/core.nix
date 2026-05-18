{
  imports = [
    ../core/boot.nix
    ../core/networking.nix
    ../core/nix-settings.nix
    ../core/security.nix
    ../core/services.nix
    ../core/user.nix

    ../apps/cli.nix
    ../desktop/fonts.nix

    ../dev/containers.nix
    ../dev/nix-ld.nix
    ../dev/git.nix
    ../dev/shell.nix
    ../dev/virt.nix
  ];
}
