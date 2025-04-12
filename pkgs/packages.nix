{ pkgs, pkgs-unstable }:
{
  stable = with pkgs; [
    pm2
 		#typescript
		#(callPackage ./nix-pawn-compiler/pawncc/default.nix {})
    #mpv-unwrapped
		#android-studio
		#gimp
		#yarn
		#waydroid
		#wget
  	#glibc
    #openssh
		#dpp
		#spicetify-cli
		# gitkraken 
  ];

  unstable = with pkgs-unstable; [
    lutris
		nodejs_22
		google-chrome
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
    #blender
    #qbittorrent 
		#chromium
    #yarn-berry
    #steam #zapzap	
    #discord
		#sublime
		#obs-studio
		#scrcpy
    (callPackage ./sorter/default.nix {}) 
  ];  
}


