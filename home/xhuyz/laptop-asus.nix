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
    ../features/programs
    ../features/packages
    ../features/wm
    ../features/devkit
    ./home.nix
  ];
  features = {
    programs = {
      nushell.enable = true;
      starship.enable = true;
      kitty.enable = true;
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
    wm = {
      gnome.enable = true;
      waybar.enable = true;
      mangowc.enable = true;
      office.enable = true;
      blender.enable = true;
      dbeaver.enable = true;
      obs.enable = true;
      media.enable = true;
      qutebrowser.enable = true;
      zen-browser.enable = true;
      nixcord.enable = true;
      redisinsight.enable = true;
      chromium.enable = true;
      chrome.enable = true;
      firefox.enable = true;
      rider.enable = true;
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
