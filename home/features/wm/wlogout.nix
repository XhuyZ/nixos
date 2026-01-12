{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.wlogout;
in
{
  options.features.wm.wlogout.enable = mkEnableOption "Wlougout";

  config = mkIf cfg.enable {
    programs = {
      wlogout = {
        enable = true;
        layout = {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        };
        style = ''
          window {
            background: #16191C;
          }

          button {
            color: #AAB2BF;
          }
        '';
      };
    };
  };
}
