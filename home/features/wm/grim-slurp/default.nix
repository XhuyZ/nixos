{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.grim-slurp;
in
{
  options.features.gui.blender.enable = mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
    ];
  };
}
