{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
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

      nixosConfigurations."wsl" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          { nixpkgs.hostPlatform = platform; }
          inputs.nixos-wsl.nixosModules.default
          ./hosts/wsl/configuration.nix
          inputs.sops-nix.nixosModules.sops
        ];
      };

      nixosConfigurations."A620MProRSWiFi" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          { nixpkgs.hostPlatform = platform; }
          ./hosts/A620M_Pro_RS_WiFi/configuration.nix
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
