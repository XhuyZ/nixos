{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.grafana;

in
{
  options.systemd.grafana.enable = mkEnableOption "enable grafana";
  config = mkIf cfg.enable {
    services.grafana = {
      enable = true;
      openFirewall = true;
      provision = {
        enable = true;
        datasources = {
          settings = {
            apiVersion = 1;
            datasources = [
              {
                name = "Prometheus";
                type = "prometheus";
                access = "proxy";
                url = "http://127.0.0.1:9090";
                isDefault = true;
                editable = false;
              }
            ];
          };
        };

      };
      settings = {
        user = {
          default_theme = "dark";
          home_page = "";

        };
        server = {
          http_addr = "127.0.0.1";
          http_port = 3000;
          enforce_domain = true;
          enable_gzip = true;
          # domain = "grafana.your.domain";
          # domain = "your.domain";
          # root_url = "https://your.domain/grafana/";
          # serve_from_sub_path = true;
        };
        security = {
          disable_initial_admin_creation = true;
        };
      };

    };
  };
}
