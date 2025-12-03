{inputs, pkgs, config,  lib, ... }:
let
  system = "x86_64-linux";
  hyprlandPkgs =  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
    programs.hyprland = {
        enable = true;
        package = hyprlandPkgs.hyprland;
        portalPackage = hyprlandPkgs.xdg-desktop-portal-hyprland;
        withUWSM = true;
        xwayland.enable = true;
    };

     services.displayManager = {
        enable = true;
        sddm.wayland.enable = true;
        sddm.enable = true;
        defaultSession = "hyprland-uwsm";
     };

    xdg.portal = {
        enable = true;
        extraPortals = [  pkgs.xdg-desktop-portal-gtk ];
    };

environment.systemPackages = with pkgs; [
# --- Entorno de Escritorio y Complementos (Wayland/Sway) ---
    xdg-desktop-portal # Implementa las API de Freedesktop para aplicaciones aisladas (necesario en Wayland)
    swaybg # Utilidad para establecer el fondo de pantalla en Wayland
    eww # Extensible Widget Wrapper, framework para crear barras, menús y widgets personalizados
    rofi # Lanzador de aplicaciones, selector de ventanas y menús dinámicos compatible con Wayland
    dunst # Daemon de notificaciones ligero y minimalista
    libnotify # Biblioteca para enviar notificaciones de escritorio

# --- Herramientas de Terminal y Clipboard ---
    kitty # Emulador de terminal rápido y rico en funciones
    cliphist # Herramienta de historial de portapapeles para Wayland
    wl-clipboard # Herramientas de línea de comandos para manipular el portapapeles de Wayland

# --- Captura de Pantalla y Manipulación de Imágenes (Wayland) ---
    grim # Utilidad para tomar capturas de pantalla en Wayland
    slurp # Utilidad para seleccionar una región rectangular de la pantalla en Wayland

# --- Audio, Media y Utilidades de Red ---
    networkmanagerapplet # Applet para gestionar la red (Wi-Fi, Ethernet, VPNs)
    mpvpaper # Herramienta para usar un video como fondo de escritorio (requiere mpv)
    playerctl # Utilidad de línea de comandos para controlar reproductores de medios compatibles con MPRIS
    gammastep # Herramienta para ajustar la temperatura de color de la pantalla según la hora del día (similar a Redshift/F.lux)
    ];

  hardware.graphics.enable32Bit = true;
}
