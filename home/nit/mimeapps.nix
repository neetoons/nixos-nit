{pkgs, ...}:
{
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "inode/directory" = "thunar.desktop";
            "application/x-gnome-saved-search" = "thunar.desktop";
            "application/epub+zip"="calibre-gui.desktop";
            "application/json"="nvim.desktop";
            "application/pdf"="zen-beta.desktop";
            "application/vnd.microsoft.portable-executable"="wine-extension-msp.desktop";
            "application/x-desktop"="nvim.desktop";
            "application/x-msdownload"="wine-extension-msp.desktop";
            "application/x-wine-extension-ini"="nvim.desktop";
            "application/x-wine-extension-pwn"="nvim.desktop";
            "audio/mpeg"="vlc.desktop";
            "image/gif"="zen-beta.desktop";
            "image/jpeg"="eog.desktop;";
            "image/png"="eog-3.desktop;";
            "image/webp"="eog.desktop;";
            "essage/rfc822"="userapp-Thunderbird-4HO7S2.desktop";
            "text/html"="userapp-Zen-AJMFF3.desktop";
            "text/plain"="nvim.desktop";
            "text/x-csrc"="nvim.desktop";
            "video/3gpp"="vlc.desktop";
            "video/mp4"="vlc.desktop";
            "video/quicktime"="vlc.desktop";
            "video/webm"="vlc.desktop";
            "video/x-matroska"="vlc.desktop";
            "x-scheme-handler/about"="brave-browser.desktop";
            "x-scheme-handler/discord"="vesktop.desktop";
            "x-scheme-handler/discord-562286213059444737"="lunarclient.desktop";
            "x-scheme-handler/eclipse+command"="_nix_store_1qwj3vqlfl5fms59bx1g7df44vm6c26g-dbeaver-bin-24.1.5_opt_dbeaver_.desktop";
            "x-scheme-handler/gitkraken"="GitKraken.desktop";
            "x-scheme-handler/http"="userapp-Zen-AJMFF3.desktop";
            "x-scheme-handler/https"="userapp-Zen-AJMFF3.desktop";
            "x-scheme-handler/lunarclient"="lunarclient.desktop";
            "x-scheme-handler/mailto"="google-chrome.desktop";
            "x-scheme-handler/mid"="userapp-Thunderbird-4HO7S2.desktop";
            "x-scheme-handler/tg"="org.telegram.desktop.desktop";
            "x-scheme-handler/tonsite"="org.telegram.desktop.desktop";
            "x-scheme-handler/unknown"="brave-browser.desktop";
            "video/mp2t"="vlc.desktop";
            "x-scheme-handler/chrome"="userapp-Zen-AJMFF3.desktop";
            "application/x-extension-htm"="userapp-Zen-AJMFF3.desktop";
            "application/x-extension-html"="userapp-Zen-AJMFF3.desktop";
            "application/x-extension-shtml"="userapp-Zen-AJMFF3.desktop";
            "application/xhtml+xml"="userapp-Zen-AJMFF3.desktop";
            "application/x-extension-xhtml"="userapp-Zen-AJMFF3.desktop";
            "application/x-extension-xht"="userapp-Zen-AJMFF3.desktop";
            "x-scheme-handler/notion"="Notion.desktop";
        };
    };    


}
