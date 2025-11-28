{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.redisinsight;
in
{
  options.features.wm.redisinsight.enable = mkEnableOption "Redis Client";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      redisinsight
    ];
  };
}
