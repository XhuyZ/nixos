{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.cursor;
in
{
  options.features.gui.cursor.enable = mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      code-cursor
    ];
  };
}
