{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.rofi;
in
{
  options.features.wm.rofi.enable = mkEnableOption "Rofi Applauncher";

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      terminal = "kitty";
      location = "center";
      modes = [
        "drun"
        "window"
        "ssh"
      ];
      configPath = "/home/xhuyz/nixos/home/features/wm/rofi/config.rasi";
    };
  };
}
