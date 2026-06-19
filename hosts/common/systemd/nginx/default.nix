{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.nginx;
in
{
  options.systemd.nginx.enable = mkEnableOption "enable nginx";

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;

      virtualHosts = {
        "git.xhuyz.me" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://127.0.0.1:3001";

            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Forwarded-Proto https;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            '';
          };
        };
        "grafana.lab" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
          };
        };
        # "forgejo.lab" = {
        #   locations."/" = {
        #     proxyPass = "http://127.0.0.1:3001";
        #   };
        # };
        "prometheus.lab" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:9090";
          };
        };

        "openwebui.lab" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:11111";
          };
        };
        "netdata.lab" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:19999";
          };
        };
      };
    };
  };
}
