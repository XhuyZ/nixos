{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./hyprland.nix
    ./mangowc.nix
    ./waybar.nix
    ./wlogout.nix
    ./rofi.nix
    ./swaylock.nix
  ];

}
