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

    surrealdb = {
      url = "github:surrealdb/surrealdb/v3.0.4";
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
      platform = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${platform};
    in
    {
      nixosConfigurations."16ITH6H4" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          { nixpkgs.hostPlatform = platform; }
          ./hosts/16ITH6H4/configuration.nix
          inputs.sops-nix.nixosModules.sops
        ];
      };

      devShells.${platform}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          just
          nixfmt
          nh
          sbctl
          sops
          age
        ];
      };

      formatter.${platform} = pkgs.nixfmt;
    };
}
