{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./mangowc/default.nix
    ./hyprland.nix
    ./waybar.nix
    ./wlogout.nix
    ./rofi.nix
    ./swaylock.nix
  ];

}
