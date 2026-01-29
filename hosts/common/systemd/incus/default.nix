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
    virtualisation.incus.enable = true;
    networking.nftables.enable = true;
  };
}
