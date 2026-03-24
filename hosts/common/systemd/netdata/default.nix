{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.netdata;

in
{
  options.systemd.netdata.enable = mkEnableOption "enable netdata";
  config = mkIf cfg.enable {
    services.netdata = {
      enable = true;
      config.global = {
        "memory mode" = "ram";
        "debug log" = "none";
        "access log" = "none";
        "error log" = "syslog";
      };
    };
    networking.firewall.allowedTCPPorts = [ 19999 ];
  };
}
