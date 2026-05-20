{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SurrealDB
    # inputs.surrealdb.packages.${pkgs.stdenv.hostPlatform.system}.default
    openssl
    # Containers
    podman-compose

    # Editors & Dev
    espflash
    probe-rs-tools
    distrobox
    typst
    esp-generate
    rustup
    espup
    platformio-core
    fnm
    uv
    git-credential-manager
    helix
    opencode

    # Build tools
    pkg-config
    gnumake
    gcc

    # Nix tooling
    nil
    nixfmt
    nixd

    # Utilities
    tree
    htop
    btop
    grc
    wget
    curl
    # inputs.llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
  ];
}
