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
    };
    wm = {
      office.enable = true;
      blender.enable = true;
      dbeaver.enable = true;
      obs.enable = true;
      media.enable = true;
      gnome.enable = true;
      qutebrowser.enable = true;
      zen-browser.enable = true;
    };
  };
}
