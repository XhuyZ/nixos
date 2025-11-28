{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.conduktor;
in
{
  options.features.wm.conduktor.enable = mkEnableOption "Kafka client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      conduktor
    ];
  };
}
