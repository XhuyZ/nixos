{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.systemd.boot;

in
{
  options.systemd.boot.enable = mkEnableOption "enable boot";
  config = mkIf cfg.enable {
  };
}
