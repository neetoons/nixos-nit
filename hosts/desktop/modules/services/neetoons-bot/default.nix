{ pkgs, ... }:
{
    systemd.services.neetoons-bot = {
        enable = true;
        description = "Mi Discord Bot en Node.js";
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];


        serviceConfig = {
            User = "nit";
            Group = "users";
            WorkingDirectory = "/home/nit/discord_bots/neetoons-bot/";
            ExecStart = ''
                ${pkgs.nodejs_24}/bin/node . 
            '';

            EnvironmentFile = "/home/nit/discord_bots/neetoons-bot/.env";
            Restart = "on-failure";
            RestartSec = 5;
        };
    };

    users.extraUsers.neetoons-bot = {
        isSystemUser = true;
        group = "users";
    };
}
