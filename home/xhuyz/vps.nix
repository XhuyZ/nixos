{ config, pkgs, lib, inputs, outputs, ... }:
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
      fastfetch.enable = true;
      gh.enable = true;
      cava.enable = true;
      btop.enable = true;
      jq.enable = true;
      kitty.enable = false;
      lazydocker.enable = false;
      k9s.enable = false;
      pinentry.enable = false;
    };
  };
}



