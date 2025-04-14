{ pkgs, pkgs-unstable }:
{
  stable = with pkgs; [
    pm2
    nodejs_22
    fluent-reader
  ];

  unstable = with pkgs-unstable; [
    lutris
    google-chrome
    wget
    harmony-music
    ghostty
    btop
    htop
    vscode
    neovim
    yt-dlp
    obsidian
    typescript
    zip
    vesktop
    telegram-desktop
    fzf
    vlc
    neofetch
    jellyfin-ffmpeg
    libsForQt5.kolourpaint
    tree
    #anki
    #waydroid
    #yarn
    #dpp
    #gitkraken
    #android-studio
    #gimp
    #blender
    #qbittorrent 
    #chromium
    #yarn-berry
    #steam
    ##zapzap	
    #discord
    #sublime
    #obs-studio
    #scrcpy
    #(callPackage ./nix-pawn-compiler/pawncc/default.nix {})
    (callPackage ./sorter/default.nix {}) 
  ];  
}


