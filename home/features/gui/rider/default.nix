{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.rider;
in
{
  options.features.gui.rider.enable = mkEnableOption "Rider";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.rider
    ];
  };
}
