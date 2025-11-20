{
    # Enable networking
    networking.networkmanager.enable = true;
    networking.hostName = "nixos"; 
    networking.firewall = {
        enable = true;
        allowPing = true;
        allowedTCPPorts = [ 7777 8081 80 5173];
        allowedUDPPorts = [];
    };
}
