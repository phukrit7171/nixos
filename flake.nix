{
  description = "NixOS configuration for 16ITH6H4";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llama-cpp = {
      url = "github:ggml-org/llama.cpp";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    surrealdb = {
      url = "github:surrealdb/surrealdb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        "16ITH6H4" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs self; };
          modules = [
            ./hosts/16ITH6H4/configuration.nix
            inputs.sops-nix.nixosModules.sops
          ];
        };
      };

      # Shell for bootstrapping
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          just
          nixfmt # Required instead of nixfmt-rfc-style
          nh
          sbctl
          sops
          age
        ];
      };

      # Formatter
      formatter.${system} = pkgs.nixfmt;
    };
}
