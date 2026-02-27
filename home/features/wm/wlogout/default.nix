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
        	background-color: rgba(0, 43, 54, 0.92);
        }

        button {
        	border-radius: 8px;
        	border-color: #073642;
        	text-decoration-color: #FFFFFF;
        	color: #FFFFFF;
        	background-color: #002b36;
        	border-style: solid;
        	border-width: 2px;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 28%;
        }

        				button:focus, button:active, button:hover {
        				outline-style: none;
        				background-color: #073642; /* base02 */
        				border-color: #268bd2; /* blue */
        				color: #93a1a1; /* base1 */}

        #lock {
        	background-image: image(url("~/nixos/home/features/wm/wlogout/assets/lock.png")); 
        }

        #logout {
        	background-image: image(url("~/nixos/home/features/wm/wlogout/assets/logout.png"));
        }

        #shutdown {
        	background-image: image(url("~/nixos/home/features/wm/wlogout/assets/shutdown.png"));
        }

        #reboot {
        	background-image: image(url("~/nixos/home/features/wm/wlogout/assets/reboot.png"));
        }      
      '';

    };
  };
}
