{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.obs;
in
{
  options.features.gui.obs.enable = mkEnableOption "OBS Studio";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
