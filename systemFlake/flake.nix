{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { nixpkgs, chaotic, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix # Your system configuration.
          chaotic.nixosModules.default # OUR DEFAULT MODULE
        ];
      };
    };
  };
}
