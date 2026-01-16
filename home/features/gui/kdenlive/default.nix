{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.kdenlive;
in
{
  options.features.gui.kdenlive.enable = mkEnableOption "Video Editing App";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };
}
