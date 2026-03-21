{ pkgs, inputs, ... }:

{
  # System-wide packages to replace the home-manager managed packages
  environment.systemPackages = with pkgs; [
    # SurrealDB
    inputs.surrealdb.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Legion
    lenovo-legion

    # Credentials
    kdePackages.ksshaskpass
    # KDE Utilities
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Character map
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # Color picker
    kdePackages.kolourpaint # Simple paint program
    kdePackages.ksystemlog # System log viewer
    kdePackages.sddm-kcm # SDDM configuration module
    kdiff3 # File/directory comparison tool

    # Hardware/System Utilities (Optional)
    kdePackages.isoimagewriter # Write hybrid ISOs to USB
    kdePackages.partitionmanager # Disk and partition management
    hardinfo2 # System benchmarks and hardware info
    wayland-utils # Wayland diagnostic tools
    vlc # Media player

    # Office
    libreoffice-fresh

    # Browsers
    brave
    google-chrome

    # Communication & Media
    spotify
    vesktop

    # Containers
    podman-compose

    # Editors & Dev
    bruno
    zed-editor
    fnm
    uv
    dbeaver-bin
    thonny
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-no-fhs
    git-credential-manager

    # Utilities
    chromedriver
    chromium
    kdePackages.kcalc
    tree
    htop
    btop
    grc
  ];
}
