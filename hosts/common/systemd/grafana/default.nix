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
    services.grafana.enable = true;
  };
}
