{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.forgejo;
in
{
  options.systemd.forgejo = {
    enable = mkEnableOption "Enable Forgejo Git service";
  };

  config = mkIf cfg.enable {

    services.forgejo = {
      enable = true;

      database.type = cfg.dbType;

      lfs.enable = cfg.lfs.enable;

      settings = {
        server = {
          DOMAIN = cfg.domain;
          ROOT_URL = "https://${cfg.domain}/";
          HTTP_PORT = cfg.httpPort;
        };

        service = {
          DISABLE_REGISTRATION = true;
        };

        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
      };
    };

    services.nginx = {
      virtualHosts.${cfg.domain} = {
        forceSSL = true;
        enableACME = true;

        extraConfig = ''
          client_max_body_size 512M;
        '';

        locations."/".proxyPass = "http://127.0.0.1:${toString cfg.httpPort}";
      };
    };
  };
}
