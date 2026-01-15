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
  ];
  features = {
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
    };
    gui = {
      office.enable = true;
      blender.enable = true;
      dbeaver.enable = true;
      obs.enable = true;
      media.enable = true;
      qutebrowser.enable = true;
      zen-browser.enable = true;
      nixcord.enable = true;
      redisinsight.enable = true;
      chrome.enable = true;
      firefox.enable = true;
      rider.enable = true;
    };
    wm = {
      gnome.enable = true;
      waybar.enable = true;
      mangowc.enable = true;
      wlogout.enable = true;
      hyprland.enable = true;
    };
    devkit = {
      nodejs.enable = true;
      dotnet_10.enable = false;
      dotnet_9.enable = true;
      dotnet_8.enable = false;
    };
  };
}
