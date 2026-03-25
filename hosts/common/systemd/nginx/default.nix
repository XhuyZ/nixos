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
        "grafana.lab" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
          };
        };
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
      };
    };
  };
}
