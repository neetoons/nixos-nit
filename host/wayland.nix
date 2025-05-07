{config, pkgs-unstable, lib, ... }:
{
    programs.hyprland = {
        enable = true;
        #xwayland.enable = true;
    };

    environment.systemPackages = with pkgs-unstable; [
        kitty
        networkmanagerapplet
        swaybg
        eww
        rofi-wayland
        dunst 
        libnotify
        wl-clipboard
        cliphist
        grim 
        slurp
        mpvpaper
    ];

    environment = {
        sessionVariables = {
        # If your cursor becomes invisible 
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
        };
    }; 

    #hardware.opengl.enable  = true;

    xdg.portal.enable = true;
    xdg.portal.xdgOpenUsePortal = true;
}

