{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.chrome;
in
{
  options.features.gui.chrome.enable = mkEnableOption "Enable chrome ";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
