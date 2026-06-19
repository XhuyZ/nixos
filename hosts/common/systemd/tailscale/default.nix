{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.tailscale;
in
{
  options.systemd.tailscale.enable = mkEnableOption "enable tailscale";

  config = mkIf cfg.enable {

    services.tailscale.enable = true;

    # ---- initrd tailscale ----

    boot.initrd.systemd.packages = [
      pkgs.tailscale
    ];

    boot.initrd.systemd.initrdBin = [
      pkgs.iproute2
      pkgs.iptables
      pkgs.tailscale
    ];

    boot.initrd.availableKernelModules = [
      "tun"
      "nft_chain_nat"
    ];

    boot.initrd.systemd.services.tailscaled = {

      unitConfig.DefaultDependencies = false;

      wantedBy = [
        "initrd.target"
      ];

      serviceConfig.Environment = [
        "PORT=41641"
        "FLAGS=--tun tailscale0"
      ];
    };

    # /var/lib/tailscale trong initrd
    # dùng chung state với stage2
    boot.initrd.systemd.mounts = [
      {
        what = "/srv/tailscale";
        where = "/var/lib/tailscale";
        type = "none";
        options = "bind";

        wantedBy = [
          "initrd.target"
        ];
      }
    ];

    boot.initrd.systemd.tmpfiles.settings."50-tailscale" = {
      "/var/run".L.argument = "/run";
    };
  };
}
