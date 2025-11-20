{pkgs, ...}:
{
  environment.systemPackages = [ pkgs.ollama ];
	services.ollama = {
    enable = true;
    acceleration = false;
    loadModels = [ "deepseek-r1:1.5b"];
  };
	#services.open-webui.enable = true;
}
