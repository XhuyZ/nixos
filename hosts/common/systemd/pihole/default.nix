{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.pihole;
in
{
  options.systemd.pihole.enable = mkEnableOption "enable pihole";

  config = mkIf cfg.enable {
    services.pihole-ftl = {
      enable = true;
    };
  };
}
