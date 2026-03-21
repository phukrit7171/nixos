{ pkgs, ... }:

{
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
