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
                                        						rootcolor=0x002b36ff
                                        						bordercolor=0x073642ff
                                        						focuscolor=0x268bd2ff
                                        						urgentcolor=0xdc322fff
                                        											#Layout
                                        											# tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
                                        											tagrule=id:1,layout_name:scroller
                                        											tagrule=id:2,layout_name:scroller
                                        											tagrule=id:3,layout_name:scroller
                                        											tagrule=id:4,layout_name:scroller
                                        											tagrule=id:5,layout_name:center_tile
                                        											tagrule=id:6,layout_name:monocle
                                        											tagrule=id:7,layout_name:tile
                                        											tagrule=id:8,layout_name:vertical_scroller
                                        											tagrule=id:9,layout_name:scroller
                                        											tagrule=id:10,layout_name:scroller
                                        											#Keys
                                        											bind=SUPER,T,spawn,kitty
                                        											bind=SUPER,B,spawn,zen
                                        											bind=SUPER,E,spawn,nautilus
                                        											bind=SUPER,A,spawn,rofi -show drun
                                        											bind=SUPER,Tab,spawn,rofi -show window
                                        											bind=SUPER,Backspace,spawn,wlogout
                                        											bind=SUPER,Q,killclient,
                                        											bind=ALT,Return,togglefullscreen,
                                        											bind=SUPER+SHIFT,L,spawn,swaylock

                                        											bind=SUPER,r,spawn,rofi -show drun
                                        											bind=SUPER+SHIFT,r,reload_config
                                        											bind=SUPER+SHIFT,e,quit,
                                        											bind=SUPER,F5,spawn,brightnessctl set 5%-
                                        											bind=SUPER,F6,spawn,brightnessctl set 5%+
        																											bind=SUPER,F2,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        																											bind=SUPER,F3,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        																											bind=SUPER,F1,spawn,wpctl set-mute   @DEFAULT_AUDIO_SINK@ toggle
                                        											bind=SUPER,H,focusdir,left
                                        											bind=SUPER,J,focusdir,down
                                        											bind=SUPER,K,focusdir,up
                                        											bind=SUPER,L,focusdir,right

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

                                        											# Thinkpad monitor
                                        											monitorrule=eDP-1,0.55,1,tile,0,1.5,0,0,1920,1200,60

                                        											exec-once=waybar
                                        											exec-once=waypaper --restore
                                        										bind=SUPER,Print,spawn,grimshot save screen


                                        																									'';

    };
  };
}
