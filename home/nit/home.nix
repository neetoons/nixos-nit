{ inputs, pkgs, ... }:
let
  #material-gtk-themes = import ./themes/material-gtk-themes/default.nix { inherit pkgs; };
  packages = import ./pkgs/packages.nix { inherit pkgs ; };
in
{
    #TODO: 
    #-  kitty 
    #-  nvim
    #-  zed
    #-  zen-browser 
    #-  ewww 
    imports = [
        ./spicetify/default.nix
        ./hypr/hypridle/default.nix
        ./hypr/hyprland/default.nix
        ./hypr/hyprlock/default.nix
        ./mimeapps.nix
        ./vscodium/default.nix
    ];
    home.username = "nit";
    home.homeDirectory = "/home/nit";
    home.stateVersion = "25.05";
    home.packages = packages.stable ++ [
        inputs.notion-desktop.packages.${pkgs.system}.default
        inputs.zen-browser.packages."${pkgs.system}".default
        inputs.pomodoro.packages.${pkgs.system}.default
        #inputs.affinity-nix.packages.x86_64-linux.v3
    ];
    
    nixpkgs.config.allowUnfree = true;

    gtk = {
        enable = true;
        cursorTheme.package = pkgs.bibata-cursors;
        cursorTheme.name = "Bibata-Modern-Ice";
        iconTheme.package = pkgs.catppuccin-papirus-folders;
        iconTheme.name = "Papirus-Dark";
    };

    home.sessionVariables = {
        EDITOR = "${pkgs.neovim}/bin/nvim";
        VISUAL = "${pkgs.zed-editor}/bin/zed-editor";
    };

    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        polarity = "dark";
    };


    #home-manager.users.username.services.kdeconnect.enable = true;
    #
    #networking.firewall = rec {
    #  allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    #  allowedUDPPortRanges = allowedTCPPortRanges;
    #};
    programs.home-manager.enable = true;
}
