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
      cfg.package
    ];

    boot.initrd.availableKernelModules = [
      "tun"
    ];

    boot.initrd.systemd.services.tailscaled = {

      description = "Tailscale initrd";

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

        ExecStart = "${cfg.package}/bin/tailscaled --state=/srv/tailscale/tailscaled.state";

        Restart = "on-failure";

      };
    };
  };
}
