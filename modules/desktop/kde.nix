{ ... }:

{
  # DESKTOP ENVIRONMENT
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
}
