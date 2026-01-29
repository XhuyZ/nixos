{
  config,
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../common
    ../features/terminal
    ../features/cli
    ../features/packages
    ../features/wm
    ../features/devkit
    ../features/gui
    ./home.nix
    ../features/desktop
  ];
  features = {
    desktop = {
      gnome.enable = false;
    };
    terminal = {
      nushell.enable = true;
      starship.enable = true;
      kitty.enable = true;
    };
    cli = {
      fastfetch.enable = true;
      gh.enable = true;
      cava.enable = true;
      btop.enable = true;
      jq.enable = true;
      lazydocker.enable = true;
      k9s.enable = true;
      git.enable = true;
      fcitx5.enable = true;
      copyq.enable = true;
      opencode.enable = true;
    };
    gui = {
      office.enable = false;
      blender.enable = false;
      dbeaver.enable = false;
      obs.enable = false;
      media.enable = false;
      qutebrowser.enable = false;
      zen-browser.enable = false;
      nixcord.enable = false;
      redisinsight.enable = false;
      chrome.enable = false;
      firefox.enable = false;
      rider.enable = false;
    };
    wm = {
      waybar.enable = false;
      mangowc.enable = false;
      wlogout.enable = false;
      hyprland.enable = false;
    };
    devkit = {
      nodejs.enable = true;
      dotnet_10.enable = true;
      dotnet_9.enable = false;
      dotnet_8.enable = false;
    };
  };
}
