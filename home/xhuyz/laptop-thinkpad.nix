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
      gnome.enable = false;
      mangowc.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
      rofi.enable = true;
      office.enable = true;
      blender.enable = false;
      dbeaver.enable = true;
      obs.enable = true;
      media.enable = true;
      qutebrowser.enable = false;
      zen-browser.enable = true;
      nixcord.enable = true;
      redisinsight.enable = false;
      chromium.enable = true;
      chrome.enable = true;
      firefox.enable = true;
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
