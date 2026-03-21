{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SurrealDB
    inputs.surrealdb.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-no-fhs

    # Containers
    podman-compose

    # Editors & Dev
    fnm
    uv
    git-credential-manager
    helix

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
    inputs.llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
  ];
}
