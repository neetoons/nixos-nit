{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs,  home-manager, ... } @ inputs:
  let 
  system = "x86_64-linux";
  localSystem = {system = "x86_64-linux";};
  pkgs = import nixpkgs {
      inherit system;
      config = {
          allowUnfree = true;
        };
    };
    in 
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs system; };
        modules = [./configuration.nix];
      };
    };
  };
}
