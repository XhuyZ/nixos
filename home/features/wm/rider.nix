{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.rider;
in
{
  options.features.wm.rider.enable = mkEnableOption "Rider";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.rider
    ];
  };
}
