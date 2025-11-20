{ pkgs, config, ... }:
  #spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
#in
{
    imports = [
        
        #configuration
        ./hardware-configuration.nix
        ./modules/timers.nix
        ./modules/wayland.nix
        ./modules/audio.nix
        ./modules/disk.nix
        ./modules/enviroment.nix
        ./modules/fonts.nix
        ./modules/file-manager.nix
        
        #programs
        ./modules/programs/android/default.nix
        #./modules/programs/ollama/default.nix

        # services
        ./modules/services/default.nix

        # virtualisation
        ./modules/virtualisation/default.nix
    ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nit = {
        isNormalUser = true;
        description = "Nit's Desktop";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    programs.dconf.enable = true;
    # flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
	

    time.timeZone = "America/Caracas";
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


    programs.ydotool.enable = true;
    security.rtkit.enable = true;

  security = {
    # If enabled, pam_wallet will attempt to automatically unlock the user’s default KDE wallet upon login.
    # If the user has no wallet named “kdewallet”, or the login password does not match their wallet password,
    # KDE will prompt separately after login.
    pam = {
      services = {
        nit = {
          kwallet = {
            enable = true;
            package = pkgs.kdePackages.kwallet-pam;
          };
        };
      };
    };
};

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
