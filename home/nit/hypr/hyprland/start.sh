#!usr/bin/env bash

# setting wallpaper
#mpvpaper VGA-1 -o "loop-playlist" /home/nit/Pictures/wallpapers/homura.mp4 &
swaybg -i "/home/nit/Pictures/2. Arte y Diseño/wallpapers/teto.png" &
# you can install this by adding
# pkgs.networkmanagerapplet to your packages
EWW="eww -c $HOME/.config/eww/nit"
${EWW} daemon &
${EWW} open-many bar &
nm-applet --indicator &
dunst &
hypridle &
rclone mount nit: /home/nit/GoogleDrive &
