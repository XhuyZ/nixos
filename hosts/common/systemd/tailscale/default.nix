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

      after = [
        "srv.mount"
        "network-online.target"
      ];

      requires = [
        "srv.mount"
      ];

      serviceConfig = {
        ExecStart = [
          ""
          "${pkgs.tailscale}/bin/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock"
        ];

        Restart = "on-failure";
      };
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
