{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.coredns;
in
{
  options.systemd.coredns.enable = mkEnableOption "enable virtualisation";

  config = mkIf cfg.enable {
    services.coredns = {
      enable = true;
      config = builtins.readFile ./Corefile;
    };
  };
}
