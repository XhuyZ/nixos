{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.hyprland;
in
{
  options.features.wm.hyprland.enable = mkEnableOption "Hyprland";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprland
    ];
    programs.hyprland.enable = true;
  };
}
