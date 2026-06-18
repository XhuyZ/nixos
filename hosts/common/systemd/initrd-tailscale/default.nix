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
      pkgs.iptables
      cfg.package
    ];

    boot.initrd.availableKernelModules = [
      "tun"
      "nft_chain_nat"
    ];

    boot.initrd.systemd.services.tailscaled = {
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
        ExecStart = "${cfg.package}/bin/tailscaled --state=/srv/tailscale/tailscaled.state";

        Environment = [
          "PORT=41641"
          "TS_DEBUG_FIREWALL_MODE=nftables"
        ];
      };
    };

  };
}
