{
  description = "Nit's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    notion-desktop.url =  "github:heytcass/notion-mac-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url =  "github:nix-community/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    pomodoro.url = "github:Esteban528/pomodoro";
    #affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  outputs = {nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    spicetify = spicetify-nix.lib.mkSpicetify;
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
          {
            home-manager.useUserPackages = true;
            home-manager = {
              users.nit = {
                  imports = [
                    spicetify-nix.homeManagerModules.default
                    stylix.homeModules.stylix
                    ./home/nit/home.nix
                  ];
                };
              extraSpecialArgs = {
                  inherit inputs pkgs-unstable;
              };
            };
          }
        ];
      };
    };
  };
}
