{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.wireguard;
in
{
  options.systemd.wireguard.enable = mkEnableOption "enable wireguard";

  config = mkIf cfg.enable {
    # knot dns resolver
    services.kresd.enable = true;

    # disable built-in dns
    services.resolved.enable = false;

    environment.etc."resolv.conf" = {
      mode = "0644";
      text = "nameserver ::1";
    };

  };
}
