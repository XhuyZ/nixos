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
  options.systemd.netdata.enable = mkEnableOption "Enable Netdata monitoring";

  config = mkIf cfg.enable {
    ## --- Netdata service ---
    services.netdata = {
      enable = true;

      # Minimal WebUI, no extra plugins
      config = {
        global = {
          "memory mode" = "ram"; # store metrics in RAM only
          "debug log" = "none"; # no debug log
          "access log" = "none"; # disable access log
          "error log" = "syslog"; # send errors to syslog
        };

        # optional: web UI default settings
        web = {
          mode = "full"; # enable WebUI
        };
      };
    };

    ## --- Firewall for Netdata ---
    networking.firewall.allowedTCPPorts = [ 19999 ];
  };
}
