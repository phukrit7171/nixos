# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Profiles
      ../../modules/profiles/core.nix
      ../../modules/profiles/workstation.nix

      # Hardware Specifics
      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/embedded.nix
      ../../modules/locale/thai.nix
    ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
  networking.hostName = "A620MProRSWiFi";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  hardware.nvidia = {
    powerManagement.finegrained = lib.mkForce true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
     amdgpuBusId = "PCI:13:0:0";
     nvidiaBusId = "PCI:1:0:0";
   };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
