{ ... }:
{
  # Enable libvirtd for virtualization
  virtualisation.libvirtd.enable = true;

  # Enable virt-manager (GUI for managing VMs)
  programs.virt-manager.enable = true;

  # Add your user to the libvirtd group to manage VMs without sudo
  users.users.phukrit7171.extraGroups = [ "libvirtd" ];

  # Recommended for better performance/clipboard support
  virtualisation.spiceUSBRedirection.enable = true;
}
