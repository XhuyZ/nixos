{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.incus;
in
{
  options.systemd.incus.enable = mkEnableOption "enable incus";

  config = mkIf cfg.enable {
    virtualisation.incus = {
      enable = true;

      preseed = {
        networks = [
          {
            name = "incusbr0";
            type = "bridge";
            config = {
              "ipv4.address" = "10.10.10.1/24";
              "ipv4.nat" = "true";
              "ipv4.dhcp" = "true";
              "dns.mode" = "managed";
            };
          }
        ];

        storage_pools = [
          {
            name = "default";
            driver = "dir";
            config = {
              source = "/var/lib/incus/storage-pools/default";
            };
          }
        ];

        profiles = [
          {
            name = "default";
            devices = {
              eth0 = {
                type = "nic";
                network = "incusbr0";
                name = "eth0";
              };

              root = {
                type = "disk";
                path = "/";
                pool = "default";
                size = "20GiB";
              };
            };
          }
        ];
      };
    };
  };
}
