{ config, ... }:
{
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      log.level = "WARN";

      certificatesResolvers.duckdns.acme = {
        email = "your-email@example.com";
        storage = "/var/lib/traefik/acme.json";
        dnsChallenge = {
          provider = "duckdns";
        };
      };

      entryPoints.web = {
        address = ":80";
        http.redirections.entryPoint = {
          to = "websecure";
          scheme = "https";
        };
      };
      entryPoints.websecure.address = ":443";
    };

    dynamicConfigOptions.http.routers = {
      xhuyz = {
        rule = "Host(`xhuyz.duckdns.org`)";
        service = "api@internal"; # đổi sang service thực tế
        entrypoints = [ "websecure" ];
        tls.certResolver = "duckdns";
      };
    };
  };

  systemd.services.traefik.serviceConfig.EnvironmentFile = [
    "${config.age.secrets.traefik.path}" # file này chứa DUCKDNS_TOKEN
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}

