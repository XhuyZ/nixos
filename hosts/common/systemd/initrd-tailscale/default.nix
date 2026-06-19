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

    enable = mkEnableOption "Enable Tailscale in initrd";

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
      pkgs.iputils
      cfg.package
    ];

    boot.initrd.kernelModules = [
      "tun"
    ];

    boot.initrd.systemd.services.initrd-tailscaled = {

      description = "Initrd Tailscale";

      wantedBy = [
        "initrd.target"
      ];

      after = [
        "srv.mount"
        "network-online.target"
      ];

      requires = [
        "srv.mount"
      ];

      serviceConfig = {

        Type = "simple";

        RuntimeDirectory = "tailscale";

        ExecStart = [
          "${cfg.package}/bin/tailscaled"
          "--state=/srv/tailscale/tailscaled.state"
          "--socket=/run/tailscale/tailscaled.sock"
          "--port=41641"
        ];

        Restart = "on-failure";
      };
    };
  };
}
