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
        "xhuyz.grafana" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
          };
        };

        "xhuyz.openwebui" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:11111";
          };
        };
      };
    };
  };
}
