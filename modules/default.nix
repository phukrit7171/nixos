{
  imports = [
    ./core/boot.nix
    ./core/networking.nix
    ./core/nix-settings.nix
    ./core/security.nix
    ./core/services.nix
    ./core/user.nix

    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/nvidia.nix
    ./hardware/printing.nix

    ./desktop/fonts.nix
    ./desktop/kde.nix

    ./apps/packages.nix

    ./dev/containers.nix
    ./dev/dev.nix
    ./dev/git.nix
    ./dev/shell.nix
  ];
}
