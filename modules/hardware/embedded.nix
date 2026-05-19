{ ... }:

{
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", MODE="0666", GROUP="plugdev"
    KERNEL=="ttyACM[0-9]*|ttyUSB[0-9]*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", MODE="0666", GROUP="plugdev"
  '';

  users.groups.plugdev = { };

  users.users.phukrit7171.extraGroups = [ "plugdev" ];
}
