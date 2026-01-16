{ config, ... }:
{
  virtualisation.oci-containers.containers."neko" = {
    image = "ghcr.io/m1k1o/neko/firefox:latest";
    ports = [ "0.0.0.0:8080:8080" ];
  };
}
