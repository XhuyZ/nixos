{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.gns3;
in
{
  options.features.gui.godot.enable = mkEnableOption "GODOT GAME ENGINE";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      godotPackages_4_6.godot
    ];
  };
}
