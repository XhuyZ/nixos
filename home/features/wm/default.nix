{ pkgs, ... }:
{
  imports = [
    ./mangowc/default.nix
    ./hyprland.nix
    ./waybar.nix
    ./wlogout.nix
    ./rofi/default.nix
    ./swaylock.nix
  ];

}
