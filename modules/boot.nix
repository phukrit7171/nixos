{ config, ... }:

{
  # BOOTLOADER
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # TPM & SECURE BOOT SUPPORT
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.tpm2.enable = true;
  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;
  security.tpm2.tctiEnvironment.enable = true;

  # KERNEL TWEAKS
  boot.kernel.sysctl = {
    "net.ipv4.tcp_fastopen" = 3;
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  # This pulls the specific driver for Legion 5 Pro (16ITH6H)
  boot.extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

  # Load the module at boot
  boot.kernelModules = [ "lenovo-legion-module" ];
}
