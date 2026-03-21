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
}
