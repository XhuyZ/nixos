{
  config,
  lib,
  pkgs,
  ...
}:
with lib;

let
  inherit (config.lib.formats.rasi) mkLiteral;
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
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-bluetooth
      ];

      theme = {
        "*" = {
          background = mkLiteral "rgba(0,43,55,1)";
          foreground = mkLiteral "rgba(129,147,150,1)";
          border-color = mkLiteral "@foreground";
          spacing = 2;
        };

        "#window" = {
          background-color = mkLiteral "@background";
          border = 1;
          padding = 5;
        };

        "#listview" = {
          spacing = 2;
          scrollbar = true;
        };

        "#textbox-prompt-colon" = {
          expand = false;
          str = ":";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@foreground";
        };
      };
    };
  };
}
