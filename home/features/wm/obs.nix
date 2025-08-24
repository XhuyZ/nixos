{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.wm.obs;
in {
  options.features.wm.obs.enable =
    mkEnableOption "OBS Studio";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    obs-studio
    ];
  };
}


