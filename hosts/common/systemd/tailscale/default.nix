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
  };
}
