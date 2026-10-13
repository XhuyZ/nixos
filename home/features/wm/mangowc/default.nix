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
    programs.mango.enable = true;
    programs.mango.addLoginEntry = true;
    wayland.windowManager.mango = {
      enable = true;
      extraConfig = builtins.readFile ./config.conf;
    };
  };
}
