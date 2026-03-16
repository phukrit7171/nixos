{ pkgs, inputs, ... }:

{
  # --- System-wide Dev Tools ---
  environment.systemPackages = with pkgs; [
    # Editors (available to all users / root)
    vscode
    arduino-ide
    opencode
    helix

    # Build tools
    pkg-config
    gnumake
    gcc

    # Nix tooling
    nil
    nixfmt
    nixd

    # CLI essentials
    wget
    curl
    inputs.llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
  ];

  # --- nix-ld (Run unpatched binaries) ---
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Core
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat

    # LLVM / Clang
    libclang.lib
    clang

    # System libraries
    glib
    libuuid
    libusb1
    libsecret
    libnotify
    libcap
    systemd
    dbus
    at-spi2-atk

    # Graphics & UI
    fontconfig
    freetype
    libGL
    libGLU
    libX11
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrender
    libXtst
    libxcb
    libXcomposite
    libXrandr
  ];
}
