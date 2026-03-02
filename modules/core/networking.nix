{ pkgs, ... }:

{
  # NETWORKING & TIME
  networking.networkmanager.enable = true;
  # time.timeZone handled by host config or default

  # VPN Netbird
  services.netbird.enable = true;
  environment.systemPackages = with pkgs; [ netbird-ui ];
}
