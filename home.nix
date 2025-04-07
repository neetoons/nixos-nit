{ config, pkgs, ... }:
let
  material-gtk-themes = import ./material-gtk-themes.nix { inherit pkgs; };
in
{
  home.username = "nit";
  home.homeDirectory = "/home/nit";
  home.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
  #home.packages = with pkgs; [];
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    theme.package = material-gtk-themes;
    theme.name = "Material-DeepOcean-B";

    iconTheme.package = pkgs.catppuccin-papirus-folders;
    iconTheme.name = "Papirus-Dark";

  };
  programs.home-manager.enable = true;
}
