{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    # Profiles
    ../../modules/profiles/core.nix
    ../../modules/profiles/workstation.nix

    # Hardware Specifics
    ../../modules/hardware/nvidia.nix
  ];

  # =================================================================
  # HOST SPECIFIC CONFIGURATION
  # =================================================================

  networking.hostName = "16ITH6H4";
  time.timeZone = "Asia/Bangkok";

  # Hardware: Lenovo Legion specific
  boot.extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];
  boot.kernelModules = [ "legion-laptop" ];
  environment.systemPackages = [ pkgs.lenovo-legion ];

  # Bluetooth Unblock Hack (Lenovo Legion)
  systemd.services.unblock-bluetooth = {
    description = "Unblock Bluetooth on Lenovo Legion";
    wantedBy = [ "multi-user.target" ];
    after = [ "bluetooth.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
      RemainAfterExit = true;
    };
  };

  # =================================================================
  # STATE VERSION
  # =================================================================
  system.stateVersion = "25.11";
}
