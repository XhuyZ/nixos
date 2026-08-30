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
  # dconf.enable = false;
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
      bluetui.enable = true;
      opencode.enable = true;
    };
    gui = {
      office.enable = true;
      dbeaver.enable = true;
      obs.enable = true;
      qutebrowser.enable = true;
      chrome.enable = true;
      firefox.enable = true;
      gns3.enable = true;
      nautilus.enable = true;
      cursor.enable = true;
      antigravity.enable = true;
    };
    # wm = {
    #   mangowc.enable = true;
    #   waybar.enable = true;
    #   wlogout.enable = true;
    #   rofi.enable = true;
    #   swaylock.enable = true;
    #   grim-slurp.enable = true;
    # };
    devkit = {
      nodejs.enable = true;
      dotnet_10.enable = false;
      dotnet_9.enable = false;
      dotnet_8.enable = false;
      golang.enable = true;
      rust.enable = true;
    };
  };
}
