{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.blender;
in
{
  options.features.gui.blender.enable = mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
