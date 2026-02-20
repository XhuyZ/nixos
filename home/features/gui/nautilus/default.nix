{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.nautilus;
in
{
  options.features.gui.nautilus.enable = mkEnableOption "Blender 3D";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nautilus
    ];
  };
}
