{ config, lib, pkgs, ... }:

let
  domain = "xhuyz"; # subdomain trên DuckDNS (không có .duckdns.org)
  token  = "8fe46c8a-4f14-4516-8ee7-721a5a934965"; # token DuckDNS
in
{
  systemd.services.duckdns-update = {
    description = "DuckDNS IP updater";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.curl}/bin/curl -s \"https://www.duckdns.org/update?domains=${domain}&token=${token}&ip=\"";
    };
  };

  systemd.timers.duckdns-update = {
    description = "Run DuckDNS updater every 5 minutes";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "5min";
      Unit = "duckdns-update.service";
    };
  };
}

