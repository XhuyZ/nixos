{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.swaylock;
in
{
  options.features.wm.swaylock.enable = mkEnableOption "Swaylock";

  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      # settings = {
      #   color = "808080";
      #   font-size = 24;
      #   indicator-idle-visible = false;
      #   indicator-radius = 100;
      #   line-color = "ffffff";
      #   show-failed-attempts = true;
      # };
    };
  };
}
