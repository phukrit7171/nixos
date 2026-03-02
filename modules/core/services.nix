{ ... }:

{
  # SYSTEM SERVICES
  zramSwap.enable = true;
  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";
  };

  services.openssh.enable = true;
  services.power-profiles-daemon.enable = true;
  services.fstrim.enable = true;
}
