{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.prometheus;

in
{
  options.systemd.prometheus.enable = mkEnableOption "enable prometheus";
  config = mkIf cfg.enable {
    services.prometheus.enable = true;
  };
}
