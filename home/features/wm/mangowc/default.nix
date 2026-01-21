{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.mangowc;
in
{
  options.features.wm.mangowc.enable = mkEnableOption "Mangowc";

  config = mkIf cfg.enable {
    wayland.windowManager.mango = {
      enable = true;
      settings = builtins.readFile ./config.conf;

    };
  };
}
