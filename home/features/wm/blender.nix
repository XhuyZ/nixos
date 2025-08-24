{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.wm.blender;
in {
  options.features.wm.blender.enable =
    mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    blender
    ];
  };
}



