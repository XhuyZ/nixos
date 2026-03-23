{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.bluetui;
in
{
  options.features.cli.bluetui.enable = mkEnableOption "bluetooth tui manager";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bluetui
    ];
  };
}
