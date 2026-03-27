{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.zoom;
in
{
  options.features.gui.zoom.enable = mkEnableOption "Rider";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zoom-us
    ];
  };
}
