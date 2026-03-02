{ pkgs, ... }:

{
  # PRINTING & SCANNING
  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ]; # General Brother laser/inkjet driver
  };

  # Enable network discovery for the printer (Avahi/mDNS)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Optional: Scanner support for the T520W
  hardware.sane = {
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

  environment.systemPackages = [ pkgs.kdePackages.skanpage ];

  hardware.printers.ensurePrinters = [
    {
      name = "Brother_DCP_T520W";
      deviceUri = "ipp://192.168.1.151/ipp";
      model = "everywhere";
      description = "Brother DCP-T520W via IPP Everywhere";
    }
  ];

  services.udev.packages = [ pkgs.brscan5 ];
}
