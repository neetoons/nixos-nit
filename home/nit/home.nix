{ inputs, pkgs-unstable, pkgs, ... }:
{
    imports = [
        ./pkgs/packages.nix
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

    programs.home-manager.enable = true;
}
