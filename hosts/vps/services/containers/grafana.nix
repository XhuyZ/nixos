{ config, pkgs, ... }:
{
  virtualisation.oci-containers.containers.grafana = {
    image = "grafana/grafana:latest";
    ports = [ "127.0.0.1:3000:3000" ];
    environment = {
      GF_SECURITY_ADMIN_USER = "admin";
      GF_SECURITY_ADMIN_PASSWORD = "admin";
    };
  };
}

