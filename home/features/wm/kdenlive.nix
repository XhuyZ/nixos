{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.wm.kdenlive;
in {
  options.features.wm.kdenlive.enable =
    mkEnableOption "Video Editing App";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    kdePackages.kdenlive
    ];
  };
}



