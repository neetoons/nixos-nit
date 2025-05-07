{ pkgs, pkgs-unstable }:
{
  stable = with pkgs; [
    pm2
    nodejs_22
    fluent-reader
    ncdu
    bun
    wine
    ranger
  ];

  unstable = with pkgs-unstable; [
    postman
    libsForQt5.kdenlive
    vesktop
    sherlock
    brave
    google-chrome
    wget
    btop
    htop
    vscode
    neovim
    yt-dlp
    obsidian
    typescript
    zip
    fzf
    vlc
    neofetch
    jellyfin-ffmpeg
    libsForQt5.kolourpaint
    tree
    anki
    discord
    scrcpy
    zapzap
    telegram-desktop
    obs-studio
    #qbittorrent 
    #steam
    #gimp
    #android-studio
    #harmony-music
    #lutris
    #waydroid
    #android-studio
    #blender
    #sublime
    (callPackage ./discord-desktop-mobile/default.nix {}) 
    (callPackage ./sorter/default.nix {}) 
  ];
}

