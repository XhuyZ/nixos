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
      # extraConfig = builtins.readFile ./config.rasi;
      extraConfig = {
        show-icons = true;
      };
      modes = [
        "drun"
        "window"
        "ssh"
      ];
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-bluetooth
      ];
    };
  };
}
