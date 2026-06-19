{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.initrd-tailscale;
in
{
  options.systemd.initrd-tailscale = {

    enable = mkEnableOption "tailscale in initrd";

    package = mkOption {
      type = types.package;
      default = pkgs.tailscale;
    };

  };

  config = mkIf cfg.enable {

    boot.initrd.systemd.packages = [
      cfg.package
    ];

    boot.initrd.systemd.initrdBin = [
      pkgs.iproute2
      pkgs.util-linux
      cfg.package
    ];

    boot.initrd.availableKernelModules = [
      "tun"
    ];

    boot.initrd.systemd.services.initrd-tailscaled = {

      description = "Tailscale in initrd";

      wantedBy = [
        "initrd.target"
      ];

      after = [
        "network-online.target"
        "srv.mount"
      ];

      requires = [
        "srv.mount"
      ];

      serviceConfig = {

        Type = "simple";

        ExecStartPre = [
          "/bin/mkdir -p /run/tailscale"
        ];

        ExecStart = ''
          ${cfg.package}/bin/tailscaled \
          --state=/srv/tailscale/tailscaled.state \
          --socket=/run/tailscale/tailscaled.sock \
          --port=41641
        '';

        Restart = "always";

        RestartSec = "2s";

      };
    };

    boot.initrd.systemd.tmpfiles.settings = {

      "tailscale-initrd" = {

        "/run/tailscale" = {
          d = {
            mode = "0755";
            user = "root";
            group = "root";
          };
        };

      };

    };

  };
}
