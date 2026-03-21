{ pkgs, ... }:

{
  # NETWORKING & TIME
  networking.networkmanager.enable = true;
  # time.timeZone handled by host config or default

  # VPN Netbird
  environment.systemPackages = with pkgs; [
    netbird
    netbird-ui
  ];
  services.netbird.enable = true;
}
