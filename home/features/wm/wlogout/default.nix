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
    home.packages = with pkgs; [
      wleave # has nicer images that wlogout
      gtk3
    ];
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];

      style = ''
        * {
          background-image: none;
          box-shadow: none;
        }

        window {
          background-color: rgba(12, 12, 12, 0.6);
        }

        button {
          border-radius: 0;
          border-color: black;
          text-decoration-color: #FFFFFF;
          color: #FFFFFF;
          background-color: #141414;
          border-style: solid;
          border-width: 1px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
        }

        button:focus, button:active, button:hover {
          outline-style: none;
          background-color: #282828;
        }

        #lock {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/lock.svg")); 
        }

        #logout {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/logout.svg"));
        }

        #shutdown {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/shutdown.svg"));
        }

        #reboot {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/reboot.svg"));
        }      
      '';

    };
  };
}
