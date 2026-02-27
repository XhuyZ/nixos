{ pkgs, ... }:
{
  imports = [
    ./mangowc/default.nix
    ./hyprland.nix
    ./waybar.nix
    ./wlogout/default.nix
    ./rofi/default.nix
    ./swaylock.nix
    ./grim-slurp/default.nix
  ];

}
