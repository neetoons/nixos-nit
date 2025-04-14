{
  description = "Nit's NixOS configuration";
  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";


  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, ... }@inputs:
  let 
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    spicetify = spicetify-nix.lib.mkSpicetify #{config options};
in
  {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pkgs-unstable; };
        modules = [
          home-manager.nixosModules.home-manager
          ./host/configuration.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nit = {
                  imports = [
                  ./home-manager/home.nix
                  ];
                };
              extraSpecialArgs = {
                  inherit  inputs;
                  inherit  pkgs-unstable;
              };
            };
          }
        ];
      };
    };
  };
}
