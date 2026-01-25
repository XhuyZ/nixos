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
      settings = {
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
      };

    };
  };
}
