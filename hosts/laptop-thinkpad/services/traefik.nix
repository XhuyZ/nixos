{config, ...}: {
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      log = {level = "WARN";};
      certificatesResolvers = {
        godaddy = {
          acme = {
            email = "letsencrypt.org.btlc2@passmail.net";
            storage = "/var/lib/traefik/acme.json";
            caserver = "https://acme-v02.api.letsencrypt.org/directory";
            dnsChallenge = {
              provider = "godaddy";
            };
          };
        };
      };
      api = {};
      entryPoints = {
        web = {
          address = ":80";
          http.redirections.entryPoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {address = ":443";};
      };
    };
    dynamicConfigOptions = {
      http = {
        middlewares = {
          auth = {
            basicAuth = {
              users = ["m3tam3re:$apr1$1xqdta2b$DIVNvvp5iTUGNccJjguKh."];
            };
          };
        };

        routers = {
          api = {
            rule = "Host(`r.m3tam3re.com`)";
            service = "api@internal";
            middlewares = ["auth"];
            entrypoints = ["websecure"];
            tls = {
              certResolver = "godaddy";
            };
          };
        };
      };
    };
  };

  systemd.services.traefik.serviceConfig = {
    EnvironmentFile = ["${config.age.secrets.traefik.path}"];
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
