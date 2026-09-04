{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.winbox;
in
{
  options.features.gui.winbox.enable = mkEnableOption "winbox router";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      winbox
    ];
  };
}
