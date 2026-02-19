{
  pkgs,
  config,
  lib,
  ...
}:

{
  options.modules.features.desktop = {
    enable = lib.mkEnableOption "Desktop Environment (Plasma 6)";
    printing.enable = lib.mkEnableOption "Printing Support";
    scanning.enable = lib.mkEnableOption "Scanning Support";
  };

  config = lib.mkIf config.modules.features.desktop.enable {
    # 1. DESKTOP ENVIRONMENT
    services.xserver.enable = true;

    # Display Manager (SDDM)
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    # Desktop (KDE Plasma 6)
    services.desktopManager.plasma6.enable = true;

    # Input
    services.libinput.enable = true;
    services.xserver.xkb.layout = "us,th";
    services.xserver.xkb.options = "grp:win_space_toggle";

    # 2. AUDIO (Pipewire)
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable CUPS to print documents.
    services.printing = lib.mkIf config.modules.features.desktop.printing.enable {
      enable = true;
      drivers = [ pkgs.brlaser ]; # General Brother laser/inkjet driver
    };

    # Enable network discovery for the printer (Avahi/mDNS)
    services.avahi =
      lib.mkIf
        (config.modules.features.desktop.printing.enable || config.modules.features.desktop.scanning.enable)
        {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };

    # Optional: Scanner support for the T520W
    hardware.sane = lib.mkIf config.modules.features.desktop.scanning.enable {
      enable = true;
      extraBackends = [
        pkgs.brscan5
        pkgs.sane-airscan
      ];
      brscan5.netDevices = {
        home = {
          model = "DCP-T520W";
          ip = "192.168.1.151"; # Consider making this configurable if needed
        };
      };
    };

    environment.systemPackages = lib.mkIf config.modules.features.desktop.scanning.enable [
      pkgs.kdePackages.skanpage
    ];

    hardware.printers.ensurePrinters = lib.mkIf config.modules.features.desktop.printing.enable [
      {
        name = "Brother_DCP_T520W";
        deviceUri = "ipp://192.168.1.151/ipp";
        model = "everywhere";
        description = "Brother DCP-T520W via IPP Everywhere";
      }
    ];

    services.udev.packages = lib.mkIf config.modules.features.desktop.scanning.enable [ pkgs.brscan5 ];
  };
}
