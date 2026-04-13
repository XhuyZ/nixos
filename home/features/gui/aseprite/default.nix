{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.aseprite;
in
{
  options.features.gui.aseprite.enable = mkEnableOption "Antigravity";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      aseprite
    ];
  };
}
