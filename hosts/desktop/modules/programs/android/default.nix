{pkgs, ...}:
{
	  #virtualisation.waydroid.enable = true;
    programs.adb.enable = true;
    environment.systemPackages =  [ pkgs.scrcpy ];
}



