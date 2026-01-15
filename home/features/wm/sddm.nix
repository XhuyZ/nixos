{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.sddm;
in
{
  options.features.wm.sddm.enable = mkEnableOption "SDDM";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      sddm-sugar-dark
      sddm-astronaut
    ];
    services.displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
        theme = "sddm-astronaut-theme";
      };
    };
  };
}
