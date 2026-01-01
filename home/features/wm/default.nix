{ pkgs, ... }:
{
  imports = [
    ./office.nix
    ./blender.nix
    ./kdenlive.nix
    ./obs.nix
    ./dbeaver.nix
    ./media.nix
    ./gnome.nix
    ./qutebrowser.nix
    ./zen-browser.nix
    ./nixcord.nix
    ./redisinsight.nix
    # ./conduktor.nix
    ./chromium.nix
    ./chrome.nix
    ./firefox.nix
    ./rider.nix
    ./hyprland.nix
  ];

}
