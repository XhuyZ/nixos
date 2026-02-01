{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.teams-for-linux;
in
{
  options.features.gui.teams-for-linux.enable = mkEnableOption "Rider";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];
  };
}
