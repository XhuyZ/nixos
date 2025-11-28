{
  config,
  lib,
  pkgs,
  dotfiles,
  ...
}:
with lib;
let
  cfg = config.features.programs.kitty;
in
{
  options.features.programs.kitty.enable = mkEnableOption "Enable Kitty terminal emulator";

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableFishIntegration = true;
        enableBashIntegration = true;
      };
      font = {
        name = lib.mkForce "CaskaydiaCove Nerd Font Mono";
      };
      settings = {
        copy_on_select = "yes";
      };
      extraConfig = builtins.readFile ./kitty.conf;
    };
  };
}
