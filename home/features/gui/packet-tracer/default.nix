{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.packettracer;
in
{
  options.features.gui.packettracer.enable = mkEnableOption "Dbeaver database client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ciscoPacketTracer8
    ];
  };
}
