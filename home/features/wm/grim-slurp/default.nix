{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.grim-slurp;
in
{
  options.features.wm.grim-slurp.enable = mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
    ];
  };
}
