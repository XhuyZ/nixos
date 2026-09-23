{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.systemd.wireguard;
in
{
  options.systemd.wireguard.enable = mkEnableOption "enable wireguard";

  config = mkIf cfg.enable {
    networking.wireguard = {
      enable = true;
    };
  };
}
