{ pkgs, pkgs-unstable }:
{
  stable = with pkgs; [
    pm2
  ];

  unstable = with pkgs-unstable; [
    lutris
    nodejs_22
    google-chrome
    wget
    spicetify-cli
    harmony-music
    ghostty
    spotify
    btop
    htop
    vscode
    neovim
    yt-dlp
    obsidian
    typescript
    newsflash
    zip
    vesktop
    telegram-desktop
    fzf
    vlc
    neofetch
    jellyfin-ffmpeg
    anki
    libsForQt5.kolourpaint
    tree
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
    #steam #zapzap	
    #discord
    #sublime
    #obs-studio
    #scrcpy
    #(callPackage ./nix-pawn-compiler/pawncc/default.nix {})
    (callPackage ./sorter/default.nix {}) 
  ];  
}


