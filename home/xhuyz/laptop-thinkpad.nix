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
    ./home.nix
  ];
  features = {
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
    };
    wm = {
      gnome.enable = false;
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
    };
  };
}
