{ inputs, pkgs, ...}:
let
    EWW="eww -c $HOME/.config/eww/nit";
in
{
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        xwayland.enable = true;
        systemd.enable = true;
    };

    xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
    xdg.configFile."hypr/start.sh".source = ./start.sh;
}
