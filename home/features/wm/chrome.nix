{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.chrome;
in
{
  options.features.wm.chrome.enable = mkEnableOption "Enable chrome ";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
