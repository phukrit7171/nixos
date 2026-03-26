{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    kontainer
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

    # Editors & Dev
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-no-fhs
    distrobox
    distroshelf
    bruno
    zed-editor
    dbeaver-bin
    thonny
    arduino-ide

    # Utilities
    chromedriver
    chromium
    netbird-ui
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      platformio.platformio-vscode-ide
    ];
  };
}
