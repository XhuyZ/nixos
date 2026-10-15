{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.openssh;

in
{
  options.systemd.uptime-kuma.enable = mkEnableOption "enable uptime kuma";

  config = mkIf cfg.enable {
    services.uptime-kuma.enable = true;
  };
}
