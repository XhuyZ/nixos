{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.redisinsight;
in
{
  options.features.gui.redisinsight.enable = mkEnableOption "Redis Client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      redisinsight
    ];
  };
}
