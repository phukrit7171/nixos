{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.modules.core.system.enable = lib.mkEnableOption "Core System Configuration";

  config = lib.mkIf config.modules.core.system.enable {
    # NETWORKING & TIME
    networking.networkmanager.enable = true;
    # time.timeZone handled by host config or default

    # VPN Netbird
    services.netbird.enable = true;
    environment.systemPackages = with pkgs; [ netbird-ui ];

    # SYSTEM SERVICES
    zramSwap.enable = true;
    services.scx = {
      enable = false; # it's bug
      scheduler = "scx_lavd";
      extraArgs = [ "--autopower" ];
    };

    services.openssh.enable = true;
    services.power-profiles-daemon.enable = true;
    services.fstrim.enable = true;

    # BLUETOOTH
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        AutoEnable = true;
      };
    };

    # UDEV RULES (FIDO2)
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="4004", MODE="0666", TAG+="uaccess", GROUP="plugdev"
    '';
  };
}
