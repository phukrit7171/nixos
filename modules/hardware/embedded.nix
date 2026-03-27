{ ... }:

{
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="303a", ATTR{idProduct}=="1001", MODE="0666", GROUP="plugdev"
  '';

  users.groups.plugdev = { };

  users.users.phukrit7171.extraGroups = [ "plugdev" ];
}
