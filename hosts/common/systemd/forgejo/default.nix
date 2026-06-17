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

    domain = mkOption {
      type = types.str;
      default = "forgejo.lab";
    };

    httpPort = mkOption {
      type = types.port;
      default = 3001;
    };

    dbType = mkOption {
      type = types.enum [
        "postgres"
        "sqlite3"
        "mysql"
      ];
      default = "postgres";
    };

    lfsEnable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Git LFS support";
    };
  };

  config = mkIf cfg.enable {

    # =========================
    # FORGEJO SERVICE
    # =========================
    services.forgejo = {
      enable = true;

      database.type = cfg.dbType;

      lfs.enable = cfg.lfsEnable;

      settings = {
        server = {
          DOMAIN = cfg.domain;
          ROOT_URL = "https://${cfg.domain}/";
          HTTP_PORT = cfg.httpPort;
        };

        service = {
          DISABLE_REGISTRATION = false;
        };

        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
      };
    };

    # =========================
    # NGINX REVERSE PROXY
    # =========================
    services.nginx = {
      virtualHosts.${cfg.domain} = {
        forceSSL = false;
        enableACME = false;

        extraConfig = ''
          client_max_body_size 512M;
        '';

        locations."/".proxyPass = "http://127.0.0.1:${toString cfg.httpPort}";
      };
    };
  };
}
