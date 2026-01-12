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
    wayland.windowManager.mango = {
      enable = true;
      settings = ''
                										# Background color of the root window (base03)
                										rootcolor=0x002b36ff

                										# Inactive window border (base02 / base01)
                										bordercolor=0x073642ff

                										# Active window border (Solarized blue)
                										focuscolor=0x268bd2ff

                										# Urgent window border (Solarized red)
                										urgentcolor=0xdc322fff
                        											#Layout
                        											# tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
                        											tagrule=id:1,layout_name:grid
                        											tagrule=id:2,layout_name:scroller
                        											tagrule=id:3,layout_name:tile
                        											tagrule=id:4,layout_name:tile
                        											tagrule=id:5,layout_name:tile
                        											tagrule=id:6,layout_name:tile
                        											tagrule=id:7,layout_name:tile
                        											tagrule=id:8,layout_name:vertical_scroller
                        											tagrule=id:9,layout_name:scroller
                        											#Keys
                        											bind=SUPER,T,spawn,kitty
                        											bind=SUPER,B,spawn,zen
                        											bind=SUPER,E,spawn,nautilus
                        											bind=SUPER,Backspace,spawn,wlogout
                        											bind=SUPER,Q,killclient,
                        											bind=SUPER,r,spawn,rofi -show drun
                        											bind=SUPER+SHIFT,r,reload_config
                        											bind=SUPER+SHIFT,e,quit,

                        											bind=SUPER,Left,focusdir,left
                        											bind=SUPER,Down,focusdir,down
                        											bind=SUPER,Up,focusdir,up
                        											bind=SUPER,Right,focusdir,right

                        											bind=SUPER+SHIFT,Left,exchange_client,left
                        											bind=SUPER+SHIFT,Down,exchange_client,down
                        											bind=SUPER+SHIFT,Up,exchange_client,up
                        											bind=SUPER+SHIFT,Right,exchange_client,right

                        											bind=SUPER,1,view,1
                        											bind=SUPER,2,view,2
                        											bind=SUPER,3,view,3
                        											bind=SUPER,4,view,4
                        											bind=SUPER,5,view,5
                        											bind=SUPER,6,view,6
                        											bind=SUPER,7,view,7
                        											bind=SUPER,8,view,8
                        											bind=SUPER,9,view,9
                        											bind=SUPER,0,view,10

                        											bind=SUPER+SHIFT,1,tag,1
                        											bind=SUPER+SHIFT,2,tag,2
                        											bind=SUPER+SHIFT,3,tag,3
                        											bind=SUPER+SHIFT,4,tag,4
                        											bind=SUPER+SHIFT,5,tag,5
                        											bind=SUPER+SHIFT,6,tag,6
                        											bind=SUPER+SHIFT,7,tag,7
                        											bind=SUPER+SHIFT,8,tag,8
                        											bind=SUPER+SHIFT,9,tag,9
                        											bind=SUPER+SHIFT,0,tag,10

                        											monitorrule=eDP-1,0.55,1,tile,0,1,0,0,1920,1080,60

                        											exec-once=waybar
                        											exec-once=waypaper --restore
        																		bind=SUPER,Print,spawn,grimshot save screen


                                                                					'';

    };
  };
}
