{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.waybar;
in
{
  options.features.wm.waybar.enable = mkEnableOption "waybar";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      networkmanager_dmenu
    ];
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = ''
        				
        				* {
        						border: none;
        						border-radius: 0;
        						font-family: Fira Code;
        						font-size: 16px;
        						min-height: 0;
        						color: @color7;
        				}
        				
        				window#waybar {
        						background-color: transparent;
        				}
        				
        				#workspaces button:first-child {
        						border-left: 0;
        				}
        				
        				#workspaces button {
        						padding-left: 10px;
        						padding-right: 10px;
        						background-color: @color5;
        						color: inherit;
        						font-weight: 600;
        				}

        				#workspaces button.focused {
        						background: @color10;
        						color: inherit;
        				}
        				
        				#pulseaudio, #cpu, #battery, #memory, #clock, #custom-screenshot, #custom-screenshot2 {
        						padding-left: 8px;
        						padding-right: 8px;
        						background-color: @color10;
        						color: inherit;
        						font-weight: 600;
        						border-radius: 0px;
        				}
        			'';
      settings = {
        mainBar = {
          layer = "top";
          "modules-left" = [
            "hyprland/workspaces"
            "ext/workspaces"
          ];
          "modules-center" = [
            "hyprland/window"
            "dwl/window"
          ];
          "modules-right" = [
            "cpu"
            "memory"
            "pulseaudio"
            "network"
            "battery"
            "clock"
          ];

          "hyprland/window" = {
            "max-length" = 50;
          };

          "battery" = {
            "format" = "{capacity}% {icon}";
            "format-icons" = [ "⚡︎" ];
          };

          "clock" = {
            "format" = "{:%H:%M}";
            "tooltip-format" = "{:%Y-%m-%d}";
          };

          "cpu" = {
            "format" = "{icon0} {icon1} {icon2} {icon3}";
            "format-icons" = [
              "▁"
              "▂"
              "▃"
              "▄"
              "▅"
              "▆"
              "▇"
              "█"
            ];
          };
          "network" = {
            "format-wifi" = " {signalStrength}%";
            "format-ethernet" = "󰈀";
            "format-disconnected" = "󰖪";
            "tooltip" = true;
            "on-click" = "nm-connection-editor";
          };

          "memory" = {
            "format" = "Mem:{percentage}%";
          };

          "pulseaudio" = {
            "format" = "Vol: {volume}%";
          };

          "custom/screenshot" = {
            "format" = "{icon}";
            "on-click" = "grim -g \"$(slurp)\" - | satty --filename -";
            "format-icons" = [ "⎙" ];
          };
        };
      };
    };
  };
}
