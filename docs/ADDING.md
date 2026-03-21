# Adding a New Host

1. Create `hosts/<hostname>/configuration.nix`:
   ```nix
   { inputs, pkgs, config, lib, ... }:
   {
     imports = [
       ./hardware-configuration.nix
       # Import profiles you want
       ../../modules/profiles/core.nix
       ../../modules/profiles/workstation.nix
       
       # Import specific hardware modules
       ../../modules/hardware/bluetooth.nix
     ];

     networking.hostName = "<hostname>";
     system.stateVersion = "25.11";
   }
   ```

2. Generate hardware config:
   ```bash
   nixos-generate-config --show-hardware-config > hosts/<hostname>/hardware-configuration.nix
   ```

3. Add to `flake.nix`:
   ```nix
   nixosConfigurations."<hostname>" = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs self; };
     modules = [
       ./hosts/<hostname>/configuration.nix
       inputs.sops-nix.nixosModules.sops
     ];
   };
   ```

4. Build: `sudo nixos-rebuild switch --flake .#<hostname>`

# Adding a New Module

This setup uses an extremely simple module structure grouped by categories (like hardware, dev, desktop).

1. Create `modules/<category>/<name>.nix`:
   ```nix
   { pkgs, config, ... }:
   {
     # Your system-wide configuration here
     environment.systemPackages = [ pkgs.neovim ];
   }
   ```

2. Enable the module by simply adding it to the `imports = []` array in one of your profiles (e.g. `modules/profiles/core.nix`) or host configuration:
   ```nix
   imports = [
     # ...
     ../<category>/<name>.nix
   ];
   ```
