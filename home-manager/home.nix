{ pkgs, pkgs-unstable, ... }:
let
  material-gtk-themes = import ./../themes/material-gtk-themes/default.nix { inherit pkgs; };
  packages = import ./../pkgs/packages.nix { inherit pkgs pkgs-unstable; };
in
{
  home.username = "nit";
  home.homeDirectory = "/home/nit";
  home.stateVersion = "24.05";
  home.packages = packages.unstable;
  nixpkgs.config.allowUnfree = true;

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
