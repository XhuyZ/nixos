{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.firefox;
in
{
  options.features.wm.firefox.enable = mkEnableOption "Firefox developer edition";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox-devedition
    ];
  };
}
