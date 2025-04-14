{ inputs, config, pkgs, pkgs-unstable, lib, ... }:
let
  packages = import ./../pkgs/packages.nix {inherit pkgs pkgs-unstable;};
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};

in
{
	imports = [ 
	  ./hardware-configuration.nix
    inputs.spicetify-nix.nixosModules.spicetify 
	];
    programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
            adblockify
            shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
    };
	# flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Bootloader
	boot.loader.grub.enable = true;
	boot.loader.grub.device = "/dev/sda";
	boot.loader.grub.useOSProber = true;

	# Automatic updating
	system.autoUpgrade.enable = true;
	system.autoUpgrade.dates = "weekly";

	# Storage optimization
  nixpkgs.config.allowUnfree = true;
	nix.optimise.automatic = true;
	nix.optimise.dates = [ "02:30" ];
	nix.settings.auto-optimise-store = true;
  nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };

	nix.extraOptions = ''
	  min-free = ${toString (100 * 1024 * 1024)}
	  max-free = ${toString (1024 * 1024 * 1024)}
	'';

  # smart
  services.smartd = {
    enable = true;
    devices = [
      {
        device = "/dev/sda"; # FIXME: Change this to your actual disk; use lsblk to find the appropriate value
      }
    ];
  };


	#virtualbox
	#virtualisation.virtualbox.host.enable = true;
	#virtualisation.virtualbox.host.enableKvm = true;
	#users.extraGroups.vboxusers.members = [ "nit" ];

	#docker
	virtualisation.docker.enable = true;
   	users.extraGroups.docker.members = ["nit"];

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  	# Configure network proxy if necessary
  	# networking.proxy.default = "http://user:password@proxy:port/";
  	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
  	time.timeZone = "America/Caracas";

	# Select internationalisation properties.
  	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "es_VE.UTF-8";
  	  	LC_IDENTIFICATION = "es_VE.UTF-8";
  	  	LC_MEASUREMENT = "es_VE.UTF-8";
  	  	LC_MONETARY = "es_VE.UTF-8";
  	  	LC_NAME = "es_VE.UTF-8";
  	  	LC_NUMERIC = "es_VE.UTF-8";
  	  	LC_PAPER = "es_VE.UTF-8";
  	  	LC_TELEPHONE = "es_VE.UTF-8";
  	  	LC_TIME = "es_VE.UTF-8";
  	};

	swapDevices = [{
		device = "/swapfile";
  	  	size = 10 * 1024; # 10GB
  	}];

	#services.gnome3 = {
	#  enable = true;
	#  extraPackages = with pkgs; [
	#    papirus-icon-theme
	#  ];
	#  settings = {
	#    "org.gnome.desktop.interface" = {
	#      icon-theme = "Papirus";
	#    };
	#  };
	#};
	#services.mysql = {
	#	enable = true;
	#	package = pkgs.mariadb;
	#};
	
	programs.adb.enable = true;
	services.ollama = {
	enable = true; 
#	acceleration = false;
	};
	services.open-webui.enable = true;

	#virtualisation.waydroid.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;

	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	#autologin
	services.xserver.displayManager.startx.enable = true;
	services.xserver.displayManager.autoLogin.enable = true;
	services.xserver.displayManager.autoLogin.user = "nit";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  security.rtkit.enable = true;
  # Enable sound with pipewire.
  services.pipewire.enable =  lib.mkForce false;
#  services.pipewire = {
#    enable = true;
#    alsa.enable = true;
#    alsa.support32Bit = true;
#    pulse.enable = false;
#    # If you want to use JACK applications, uncomment this
#    #jack.enable = true;
#
#    # use the example session manager (no others are packaged yet so this is enabled by default,
#    # no need to redefine it in your config for now)
#    #media-session.enable = true;
#  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nit = {
    isNormalUser = true;
    description = "Nit Casablancas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget

 environment = {
    sessionVariables = {
		GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (with pkgs.gst_all_1; [
		gst-plugins-good
		gst-plugins-bad
		gst-plugins-ugly
		gst-libav
	]);
    };
  };
  
   fonts.packages = with pkgs; [
    inter
    nerdfonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    roboto
    iosevka
   ];


	# paquetes
	environment.systemPackages = packages.stable; 
  #with pkgs; [
		#pm2

	#];
  #services.samba = {
  #  enable = true;
  #  securityType = "user";
  #  openFirewall = true;
  #};

  #services.samba-wsdd = {
  #  enable = true;
  #  openFirewall = true;
  #};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# If you want to make startup apps copy his .desktop to ~/.config/autostart
	# Use $ ls -l /run/current-system/sw/share/applications | grep yourapp

	systemd.services.pm2 = {
		wantedBy = [ "multi-user.target" ];
		enable = true;
		serviceConfig = {
			Type="forking";
			User="root";
			LimitNOFILE="infinity";
			LimitNPROC="infinity";
			LimitCORE="infinity";
			Environment= "PATH=/run/wrappers/bin:/root/.nix-profile/bin:/nix/profile/bin:/root/.local/state/nix/profile/bin:/etc/profiles/per-user/root/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:${pkgs.nodejs_22}/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin";
			PIDFile="/root/.pm2/pm2.pid";
			Restart = "on-failure";
			ExecStart = ''${pkgs.pm2}/lib/node_modules/pm2/bin/pm2 resurrect'';
			ExecReload = ''${pkgs.pm2}/lib/node_modules/pm2/bin/pm2 reload all'';
			ExecStop = ''${pkgs.pm2}/lib/node_modules/pm2/bin/pm2 kill'';
			RestartSec = "5s";
		};
	};


	# Open ports in the firewall.
	networking.firewall.enable = true;
	networking.firewall.allowedTCPPorts = [ 7777 ];
	#networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	#networking.firewall.enable = true;
	networking.firewall.allowPing = true;
	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
