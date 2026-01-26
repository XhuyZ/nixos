{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.prometheus;

in
{
  options.systemd.prometheus.enable = mkEnableOption "enable prometheus";
  config = mkIf cfg.enable {
    services.prometheus = {
      enable = true;
      port = 9090;
      globalConfig.scrape_interval = "2s"; # "1m"
      ruleFiles = [
        ./node-basic.yml
      ];
      scrapeConfigs = [
        {
          job_name = "node";
          static_configs = [
            {
              targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
            }
          ];
        }
      ];
      exporters.node = {
        enable = true;
        port = 9000;
        # For the list of available collectors, run, depending on your install:
        # - Flake-based: nix run nixpkgs#prometheus-node-exporter -- --help
        # - Classic: nix-shell -p prometheus-node-exporter --run "node_exporter --help"
        enabledCollectors = [
          "ethtool"
          "softirqs"
          "systemd"
          "tcpstat"
          "wifi"
        ];
        # You can pass extra options to the exporter using `extraFlags`, e.g.
        # to configure collectors or disable those enabled by default.
        # Enabling a collector is also possible using "--collector.[name]",
        # but is otherwise equivalent to using `enabledCollectors` above.
        extraFlags = [
          "--collector.ntp.protocol-version=4"
          "--no-collector.mdadm"
        ];
      };
    };
  };
}
