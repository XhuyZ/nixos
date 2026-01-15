{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.firefox;
in
{
  options.features.gui.firefox.enable = mkEnableOption "Firefox developer edition";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox-devedition
    ];
  };
}
