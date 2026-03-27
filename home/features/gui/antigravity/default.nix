{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.antigravity;
in
{
  options.features.gui.antigravity.enable = mkEnableOption "Antigravity";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      antigravity
    ];
  };
}
