{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [
      pkgs.brscan5
      pkgs.sane-airscan
    ];
  };

  environment.systemPackages = [ pkgs.kdePackages.skanpage ];

  services.udev.packages = [ pkgs.brscan5 ];
}
