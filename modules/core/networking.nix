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
  systemd.services.netbird-daemon = {
    description = "NetBird Daemon";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.netbird}/bin/netbird service run";
      Restart = "always";
      RuntimeDirectory = "netbird";
    };
  };
}
