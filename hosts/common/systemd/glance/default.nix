{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.glance;

in
{
  options.systemd.glance.enable = mkEnableOption "enable glance";
  config = mkIf cfg.enable {
    services.glance = {
      enable = true;
    };
  };
}
