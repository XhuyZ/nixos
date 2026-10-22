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
      bluetui.enable = true;
    };
    # devkit = {
    #   nodejs.enable = true;
    #   dotnet_10.enable = true;
    #   dotnet_9.enable = false;
    #   dotnet_8.enable = false;
    #   golang.enable = true;
    #   rust.enable = true;
    # };
  };
}
