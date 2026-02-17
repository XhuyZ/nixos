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
  dconf.enable = false;
  features = {
    desktop = {
      gnome.enable = false;
    };
    terminal = {
      kitty.enable = true;
      nushell.enable = true;
      starship.enable = true;
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
    };
    gui = {
      office.enable = true;
      blender.enable = false;
      dbeaver.enable = true;
      obs.enable = true;
      media.enable = false;
      qutebrowser.enable = false;
      zen-browser.enable = true;
      nixcord.enable = true;
      redisinsight.enable = false;
      chrome.enable = true;
      firefox.enable = true;
      rider.enable = true;
      teams-for-linux.enable = true;
      packettracer.enable = false;
      rustrover.enable = true;
      gns3.enable = true;
    };
    wm = {
      mangowc.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
      rofi.enable = true;
      swaylock.enable = true;
    };
    devkit = {
      nodejs.enable = true;
      dotnet_10.enable = true;
      dotnet_9.enable = false;
      dotnet_8.enable = false;
      golang.enable = true;
      rust.enable = true;
    };
  };
}
